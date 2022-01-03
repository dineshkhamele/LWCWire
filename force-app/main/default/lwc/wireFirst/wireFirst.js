import { LightningElement, wire, api } from 'lwc';
import getResponse from '@salesforce/apex/ApexClass.getResponse';

export default class WireFirst extends LightningElement {
     input='Din';
    constructor(){
        super();
    }

    connectedCallback(){
        console.log('text',this.text);
    }

    @wire(getResponse,{text:'$input'})
    text;

}