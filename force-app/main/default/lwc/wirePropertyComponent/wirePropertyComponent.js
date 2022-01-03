import {LightningElement, wire, track} from 'lwc';
import accountclass from '@salesforce/apex/Acountclass.accountclass';
export default class AccountListLWC extends LightningElement {
   @track accounts;
   @track error;
   @wire(accountclass) accounts;
}