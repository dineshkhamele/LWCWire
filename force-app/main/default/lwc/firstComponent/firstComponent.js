import { LightningElement } from "lwc";

export default class FirstComponent extends LightningElement {
  varP;

  constructor() {
    super();
    this.varP =
      this instanceof LightningElement &&
      LightningElement instanceof HTMLElement;
  }
}
