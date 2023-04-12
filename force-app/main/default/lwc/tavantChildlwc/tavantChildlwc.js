import { LightningElement, track } from 'lwc';
export default class TavantChildlwc extends LightningElement {

    @track param1;
    @track param2;

    handleName(event){
       if(event.target.name == 'name'){
           this.param1 = event.detail.value;
       }
    }

    handleAge(event){
       if(event.target.name == 'age'){
           this.param2 = event.detail.value;
       }
    }

    callMe(event){
        const selectedEvent = new CustomEvent('custevent', {
            detail: {
                name: this.param1,
                age:this.param2
            } 
        });
        this.dispatchEvent(selectedEvent);
    }

}