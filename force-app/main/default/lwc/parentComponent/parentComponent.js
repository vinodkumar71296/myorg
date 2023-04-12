import { LightningElement } from "lwc";
export default class ParentComponent extends LightningElement {
  parentfirstinput;
  parentsecondinput;

  parentfirstoutput;
  parentsecondoutput;

  handleChange(event) {
    const evntname = event.target.name;
    if (evntname === "parentfirstinput") {
      this.parentfirstinput =
        event.target.value != null ? event.target.value : null;
    } else {
      this.parentsecondinput =
        event.target.value != null ? event.target.value : null;
    }
  }

  handleInputCarryEvent(event) {
    this.parentfirstoutput = event.detail.FirstInput;
    this.parentsecondoutput = event.detail.SecondInput;
  }
}