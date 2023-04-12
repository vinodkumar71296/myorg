import { LightningElement} from 'lwc';
export default class LightningInputDisable extends LightningElement {
    isvisible = false;
    //inputVal =true ;
    disableBtn = true;
    ischecked = false;

    handleChange(event){
      if(event.target.checked){
        this.disableBtn = false;
        this.isvisible = true;
      }else{
        this.disableBtn = true;

      }
    }
        

}