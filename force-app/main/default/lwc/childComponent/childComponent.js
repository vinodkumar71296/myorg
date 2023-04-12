import { LightningElement, api } from "lwc";
export default class ChildComponent extends LightningElement {
  @api getparentfirstinput;
  @api getparentsecondinput;

  childfirstinput;
  childsecondinput;

  callMe(event) {
    const evntname = event.target.name;
    if (evntname === "firstinput") {
      this.childfirstinput =
        event.target.value != null ? event.target.value : null;
    } else {
      this.childsecondinput =
        event.target.value != null ? event.target.value : null;
    }
    const newEvent = new CustomEvent("inputcarryevent", {
      detail: {
        FirstInput: this.childfirstinput,
        SecondInput: this.childsecondinput
      }
    });
    this.dispatchEvent(newEvent);
  }
}