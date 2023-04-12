import { LightningElement, track, api } from 'lwc';
export default class ChildLWC extends LightningElement {

    @track myName;
    @track myAge;

    @api
    handleChange(param1, param2){
        this.myName = param1;
        this.myAge = param2;
    }

}