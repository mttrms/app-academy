class Clock {
	constructor() {
		const date = new Date();
		this.time = {
			hour: date.getHours(),
			minute: date.getMinutes(),
			second: date.getSeconds()
		}

		this.printTime();
		setInterval(() => {
			this._tick();
		}, 1000);
	}

	printTime() {
		const time = this.time;
		
		console.log(`${time.hour}:${time.minute}:${time.second}`);
	}
	
	_tick() {
		const time = this.time;
		time.second += 1;

		if (time.second === 60) {
			time.second = 0;
			time.minute += 1;
		}

		if (time.minute === 60) {
			time.minute = 0;
			time.hour +=1;
		}

		if (time.hour === 24) {
			time.hour = 0;
		}

		this.printTime();		
	}
}

const clock = new Clock();
