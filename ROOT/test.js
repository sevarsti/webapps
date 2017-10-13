var fromVosBuffer = function(buffer) {
	var readInt = function(l) {
		var e = (arguments.length > 1 ? arguments[1] : LittleEndian);
		var r = buffer.getInt(l, p, e);
		p += l;
		return r;
	};
	var readUint = function(l) {
		var e = (arguments.length > 1 ? arguments[1] : LittleEndian);
		var r = buffer.getUint(l, p, e);
		p += l;
		return r;
	};
	var readText = function(l) {
		var r = buffer.getText(p, l);
		p += l;
		return r;
	};
	var readDelta = function() {
		var r = 0;
		for (var i = 0; i < 4; i++) {
			var v = readUint(1);
			if (v < 0x80) {
				r *= 128;
				r += v;
				break;
			}
			 else {
				v -= 0x80;
				r *= 128;
				r += v;
			}
		}
		return r;
	};
	var meta = {};
	meta["BufferVos"] = buffer;
	var vos = {};
	var actionData = [];
	var beatData = [];
	var p = 0;
	var timeSet = []; //ff 51 03µÄbpmÇåµ¥
	var sequSet = [];
	var beatMax = 0;
	var readMidCore = function() {
		p += 10;
		var n = readInt(2, false);
		var frame = 1;
		var frametick = 120;
		var tick = (function() {
			var p1 = readUint(1);
			var p2 = readUint(1);
			if (p1 < 0x80) {
				frame = 1;
				frametick = p1 * 256 + p2;
			}
			 else {
				frame = p1 - 0x80;
				frametick = p2;
			}
			return frame * frametick;
		})();
		var index = [];
		var comment = [];
		var author = [];
		var title = [];
		var instrument = [];
		var lyrics = [];
		var tag = [];
		var prompt = [];
		var chanel = [];
		var offset = [];
		var timespan = 500;
		var sequencer = 192;
		var bom = 4;
		var bon = 4;
		var toc = 24;
		var com = 8;
		timeSet = [[0, timespan]];
		sequSet = [[0, sequencer]];
		for (var i = 0; i < n; i++) {
			p += 4;
			var e = readInt(4, false) + p;
			var t = 0;
			while (p < e) {
				var d = readDelta();
				t += d / tick * 4;
				var c = readUint(1);
				if (c == 0xFF) {
					c = readUint(1);
					switch (c) {
					case 0x00:
						index[i] = readInt(readUint(1), false);
						break;
					case 0x01:
						comment[i] = readText(readUint(1));
						break;
					case 0x02:
						author[i] = readText(readUint(1));
						break;
					case 0x03:
						title[i] = readText(readUint(1));
						break;
					case 0x04:
						instrument[i] = readText(readUint(1));
						break;
					case 0x05:
						lyrics[i] = readText(readUint(1));
						break;
					case 0x06:
						tag[i] = readText(readUint(1));
						break;
					case 0x07:
						prompt[i] = readText(readUint(1));
						break;
					case 0x20:
						chanel[i] = readInt(readUint(1));
						break;
					case 0x21:
						p = readUint(1) + p;
						break;
					case 0x2F:
						p = readUint(1) + p;
						break;
					case 0x51:
						var v = readInt(readUint(1), false) / 1000 / 4;
						if (v != timespan) {
							timespan = v;
							if (t != timeSet[timeSet.length - 1][0]) {
								timeSet.push([t, timespan]);
							}
							 else {
								timeSet[timeSet.length - 1][1] = timespan;
							}
						}
						break;
					case 0x54:
						var h = readUint(1);
						var m = readUint(1);
						var s = readUint(1);
						var f = readUint(1);
						offset[i] = (((h * 60) + m) * 60 + s) * 1000 + f * 1000 / frame;
						break;
					case 0x58:
						bom = readUint(1);
						bon = Math.pow(2, readUint(1));
						toc = readUint(1);
						com = readUint(1);
						var v = toc * com * bon / bom;
						if (v != sequencer) {
							sequencer = v;
							if (t != sequSet[sequSet.length - 1][0]) {
								sequSet.push([t, sequencer]);
							}
							 else {
								sequSet[sequSet.length - 1][1] = sequencer;
							}
						}
						break;
					case 0x59:
						p = readUint(1) + p;
						break;
					case 0x7F:
						p = readUint(1) + p;
						break;
					}
				}
			}
			if (t > beatMax) {
				beatMax == t;
			}
		}
		beatMax = Math.ceil(beatMax / 4) * 4;
	}
	switch (buffer[4]) {
	case 0x40:
		var seg = [];
		var readHeader = (function() {
			for (var i = 0; i < 3; i++) {
				p += 4;
				for (var i = 0; i < 3; i++) {
					seg.push(readInt(4, true));
					p += 16;
				}
			}
		})();
		var readInf = (function() {
			p = seg[0];
			var n = 4;
			if ((buffer[p] == 0x56) && (buffer[p + 1] == 0x4F) && (buffer[p + 2] == 0x53) && (buffer[p + 3] == 0x31)) {
				p += 4;
				p += 2;
				p += 64;
				n = 5;
			}
			vos.title = readText(readUint(1));
			meta["Title"] = vos.title;
			vos.artist = readText(readUint(1));
			meta["Artist"] = vos.artist;
			vos.comment = readText(readUint(1));
			meta["Comment"] = vos.comment;
			if (n == 5) {
				p = readUint(1) + p;
			}
			vos.author = readText(readUint(1));
			meta["Author"] = vos.author;
			vos.genre = readUint(1);
			meta["Genre"] = ["Pop", "New Age", "Techno", "Rock", "SoundTrack", "Game&Anime", "Jazz", "CenturyEnd", "Classical", "Other"][vos.genre];
			p += 1;
			vos.time = readInt(4, true);
			meta["Time"] = vos.time;
			vos.level = readUint(1);
			meta["Level"] = (vos.level + 1).toString();
			p += 1023;
			vos.instrument = [];
			vos.data = [];
			for (var i = 0; i < 16; i++) {
				vos.instrument[i] = readInt(4, true);
				vos.data[i] = [];
				var n = readInt(4, true);
				p += 14;
				for (var j = 0; j < n; j++) {
					var timestamp = readInt(4, true);
					var timespan = readInt(4, true);
					var index = readUint(1) - 0x90;
					var pitch = readUint(1);
					var volume = readUint(1);
					var track = readUint(1);
					var type = readUint(1);
					var islong = 0;
					var isuser = 0;
					if (type >= 0x80) {
						type -= 0x80;
						islong = 1;
					}
					if (track >= 0x80) {
						track -= 0x80;
						isuser = 1;
					}
					track = parseInt(track.toString(16).fill(2, "0", true)[0]);
					vos.data[i][j] = [];
					vos.data[i][j][0] = timestamp;
					vos.data[i][j][1] = track;
					vos.data[i][j][2] = islong;
					vos.data[i][j][3] = timespan;
					vos.data[i][j][4] = pitch;
					vos.data[i][j][5] = volume;
					vos.data[i][j][6] = isuser;
					vos.data[i][j][7] = type;
				}
			}
		})();
		var readMid = (function() {
			p = seg[1];
			meta["BufferMid"] = new Uint8Array(buffer.buffer, seg[1], seg[2] - seg[1]);
			readMidCore();
		})();
		break;
	case 0x0C:
		p += 4;
		var readTrk = (function() {
			p = readInt(4, true) + p;
			var m = readInt(4, true) + p;
			p += 3;
			var v = parseInt(readText(3));
			vos.title = readText(readInt(2, true));
			meta["Title"] = vos.title;
			vos.artist = readText(readInt(2, true));
			meta["Artist"] = vos.artist;
			vos.comment = readText(readInt(2, true));
			meta["Comment"] = vos.comment;
			vos.author = readText(readInt(2, true));
			meta["Author"] = vos.author;
			vos.genre = readText(readInt(2, true));
			meta["Genre"] = vos.genre;
			p += 11;
			p += 4;
			p += 4;
			p += 1024;
			vos.instrument = [];
			vos.data = [];
			var l = readInt(4, true);
			p += 4;
			for (var i = 0; i < l; i++) {
				vos.instrument[readUint(1, true)] = readInt(4, true);
			}
			p += 1;
			vos.level = readUint(1);
			meta["Level"] = (vos.level + 1).toString();
			vos.mode = readText(readInt(2, true));
			p += 4;
			for (var i = 0; i < l; i++) {
				vos.data[i] = [];
				var n = readInt(4, true);
				for (var j = 0; j < n; j++) {
					p += 1;
					var timestamp = readInt(4, true);
					var pitch = readUint(1, true);
					var index = readUint(1, true) - 1;
					var volume = readUint(1, true);
					var isuser = readUint(1, true);
					p += 1;
					var islong = readUint(1, true);
					var timespan = readInt(4, true);
					p += 1;
					vos.data[i][j] = [];
					vos.data[i][j][0] = timestamp;
					vos.data[i][j][1] = -1;
					vos.data[i][j][2] = islong;
					vos.data[i][j][3] = timespan;
					vos.data[i][j][4] = pitch;
					vos.data[i][j][5] = volume;
					vos.data[i][j][6] = isuser;
					vos.data[i][j][7] = 0;
				}
			}
			p += 4;
			var c = readInt(4, true);
			for (var n = 0; n < c; n++) {
				vos.data[readUint(1, true)][readInt(4, true)][1] = readUint(1, true);
			}
			p = m;
		})();
		var readMid = (function() {
			p = readInt(4, true) + p;
			var m = readInt(4, true) + p;
			meta["BufferMid"] = new Uint8Array(buffer.buffer, p, m - p);
			readMidCore();
		})();
		break;
	}
	for (var i = 0; i < vos.data.length; i++) {
		if (typeof vos.data[i] === "undefined") {
			continue;
		}
		for (var j = 0; j < vos.data[i].length; j++) {
			if (vos.data[i][j][6]) {
				if (vos.data[i][j][1] < 0) {
					continue;
				}
				var action = (vos.data[i][j][2] == 0 ? 0x00: 0x02);
         var timespan = vos.data[i][j][3];
				if (action == 0x00) {
					timespan = 0;
				}
				actionData.push([vos.data[i][j][0], vos.data[i][j][1], action, timespan]); //0: sequence
			}
		}
	}
	actionData = actionData.sort(SortNumbers);
	for (var i = 0; i < actionData.length; i++) {
		for (var j = i + 1; j < actionData.length; j++) {
			if (actionData[j][0] <= actionData[i][0] + actionData[i][3]) {
				if (actionData[i][1] == actionData[j][1]) {
					actionData.splice(j, 1);
					j -= 1;
				}
			}
			 else {
				break;
			}
		}
	}
	var sequMax = (function() {
		var r = 0;
		for (var i = 0; i < actionData.length; i++) {
			switch (actionData[i][2]) {
			case 0x00:
				if (r < actionData[i][0]) {
					r = actionData[i][0];
				}
				break;
			case 0x02:
				if (r < actionData[i][0] + actionData[i][3]) {
					r = actionData[i][0] + actionData[i][3];
				}
				break;
			}
		}
		return r;
	})();
	var sequBeat = (function() {
		var r = [0];
		var t = 0;
		var n = 0;
		while (t < sequMax) {
			while ((sequSet.length > n + 1) && (r.length - 1 >= sequSet[n + 1][0])) {
				n += 1;
			}
			var p = r.length - 1;
			while ((sequSet.length > n + 1) && (sequSet[n + 1][0] - r.length < 0)) {
				t += sequSet[n][1] * (sequSet[n + 1][0] - p);
				p = sequSet[n + 1][0];
				n += 1;
			}
			t += sequSet[n][1] * (r.length - p);
			r.push(Math.round(t));
		}
		return r;
	})();
	var timeBeat = (function() {
		var r = [0];
		var t = 0;
		var n = 0;
		for (var i = 0; i < sequBeat.length; i++) {
			while ((timeSet.length > n + 1) && (i >= timeSet[n + 1][0])) {
				n += 1;
			}
			var p = i;
			while ((timeSet.length > n + 1) && (timeSet[n + 1][0] - i < 1)) {
				t += timeSet[n][1] * (timeSet[n + 1][0] - p);
				p = timeSet[n + 1][0];
				n += 1;
			}
			t += timeSet[n][1] * (i + 1 - p);
			r.push(t);
		}
		return r;
	})();
	var timeMax = (function() {
		while (timeBeat.length < beatMax + 1) {
			timeBeat.push(timeSet[timeSet.length - 1][1]);
		}
		return timeBeat[timeBeat.length - 1];
	})();
	var sequToTime = function(s) {
		for (var i = 0; i < sequBeat.length; i++) {
			if (s < sequBeat[i]) {
				return timeBeat[i - 1] + (s - sequBeat[i - 1]) / (sequBeat[i] - sequBeat[i - 1]) * (timeBeat[i] - timeBeat[i - 1]);
			}
		}
	};
	for (var i = 0; i < actionData.length; i++) {
		actionData[i][3] = Math.round(sequToTime(actionData[i][0] + actionData[i][3]) - sequToTime(actionData[i][0]));
		actionData[i][0] = Math.round(sequToTime(actionData[i][0]));
	}
	for (var i = 0; i < timeBeat.length - 1; i++) {
		beatData.push([timeBeat[i], 60000 / (timeBeat[i + 1] - timeBeat[i])]);
	}
	beatData = enlargeBeatData(offsetBeatData(beatData, 0), actionData);
	meta["BufferVos"] = vos;
   fromData(meta, [{"ActionData": actionData, "BeatData": beatData, "Length": timeMax}]);
};