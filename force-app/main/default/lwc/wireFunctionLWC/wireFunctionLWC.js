// WireFunctionLWC.js
import { LightningElement, api, track, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
export default class WireFunctionLWC extends LightningElement {
    @api recordId='0017F000005lch4QAA';
    @track record;
    @track error;

    constructor(){
        super();
        console.log('in constructor');
    }

    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name'] })
    wiredAccount({ error, data }) {
        console.log('in wire method',this.recordId);
        if (data) {
            this.record = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.record = undefined;
        }
    }
    get name() {
        return this.record.fields.Name.value;
    }
}