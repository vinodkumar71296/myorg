import { LightningElement, track } from 'lwc';
export default class TavantParentlwc extends LightningElement {

    @track myName;
    @track myAge;

    CallMee(event){
        this.myName = event.detail.name;
        this.myAge = event.detail.age;
    }

}