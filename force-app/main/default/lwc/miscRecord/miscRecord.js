import { LightningElement, api } from 'lwc';

export default class MiscRecord extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api flexipageRegionWidth;
}