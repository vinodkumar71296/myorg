import { LightningElement,wire,track } from 'lwc';
import getUsers from '@salesforce/apex/UserDataRest.getUsers';

export default class UserTiles extends LightningElement {
    
     users;

@wire(getUsers)Wiredusers({error,data})
        {
                if(data){
                        this.users = JSON.parse(data).data;
                        console.log();
                } else if (error){
                        console.error(error);
                }
        }
}