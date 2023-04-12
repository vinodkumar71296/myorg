import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


export default class LwcPrepopulateValue  extends NavigationMixin(LightningElement) {

    createRecord() {
        // Navigate to the Account home page
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'                
            },
           /* state : {
                nooverride: '1',
                defaultFieldValues:"Name=Tushar Sharma,AccountNumber=55555,NumberOfEmployees=35000,Phone=9988776655,Site=https://newstechnologystuff.com/"
            }*/
        });
    }
}