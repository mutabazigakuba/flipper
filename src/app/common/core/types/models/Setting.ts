export class Setting {
	id: number;
	name: string;
	value: string;
	created_at: string;
	updated_at: string;
	private: boolean;

	constructor(params: Object = {}) {
        for (const name in params) {
            this[name] = params[name];
        }
    }
}
