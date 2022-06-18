import { LightningElement, track } from "lwc";
export default class AccountListLWC extends LightningElement {
  @track accounts;
  @track error;
}
