import { LightningElement, track } from 'lwc';

export default class CarList extends LightningElement {
    @track selectedCategory = 'luxury';
    @track cars = [];

    handleCategoryChange(event) {
        this.selectedCategory = event.target.value;
        this.getCarsByCategory();
    }

    getCarsByCategory() {
        // Use a switch statement to set the list of cars based on the selected category
        switch (this.selectedCategory) {
            case 'luxury':
                this.cars = [
                    {
                        make: 'Mercedes',
                        model: 'S-Class'
                    },
                    {
                        make: 'BMW',
                        model: '7 Series'
                    },
                    {
                        make: 'Audi',
                        model: 'A8'
                    }
                ];
                break;
            case 'sedan':
                this.cars = [
                    {
                        make: 'Toyota',
                        model: 'Camry'
                    },
                    {
                        make: 'Honda',
                        model: 'Accord'
                    },
                    {
                        make: 'Ford',
                        model: 'Fusion'
                    }
                ];
                break;
            case 'sports':
                this.cars = [
                    {
                        make: 'Porsche',
                        model: '911'
                    },
                    {
                        make: 'Chevrolet',
                        model: 'Corvette'
                    },
                    {
                        make: 'Ford',
                        model: 'Mustang'
                    }
                ];
                break;
            case 'cabs':
                this.cars = [
                    {
                        make: 'Toyota',
                        model: 'Prius'
                    },
                    {
                        make: 'Ford',
                        model: 'Focus'
                    },
                    {
                        make: 'Chevrolet',
                        model: 'Volt'
                    }
                ];
                break;
            case 'van':
                this.cars = [
                    {
                        make: 'Ford',
                        model: 'Transit'
                    },
                    {
                        make: 'Mercedes',
                        model: 'Sprinter'
                    },
                    {
                        make: 'Toyota',
                        model: 'Sienna'
                    }
                ];
                break;
            default:
                this.cars = [];
        }
    }

    connectedCallback() {
        this.getCarsByCategory();
    }
}