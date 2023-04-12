import { LightningElement, track} from 'lwc';
export default class CheckboxComponent extends LightningElement {
/* handleClick(){
    this.template.querySelectorAll('lightning-input').forEach(item=>{
        item.disabled=true;

    })
}*/
testTheData() {
    let searchCmp = this.template.querySelector(".nameCmp");
    let dateCmp = this.template.querySelector(".dateCmp");
    let checkCmp = this.template.querySelector(".checkCmp");
    let searchvalue = searchCmp.value;
    let dtValue = dateCmp.value;
    let chkValue = checkCmp.value;
    
    if (!searchvalue && chkValue == true ) {
        searchCmp.setCustomValidity("Name value is required");
    } else {
        searchCmp.setCustomValidity("");
    }
    searchCmp.reportValidity();

    if (!dtValue) {
        dateCmp.setCustomValidity("Date value is required");
    } else {
        dateCmp.setCustomValidity("");
    }
    dateCmp.reportValidity();
}

}