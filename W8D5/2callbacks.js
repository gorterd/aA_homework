function Cat() {
    this.name = 'Markov';
    this.age = 3;
}

function Dog() {
    this.name = 'Noodles';
    this.age = 4;
}

Dog.prototype.chase = function (cat) {
    console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
};

const markov = new Cat();
const noodles = new Dog();

noodles.chase(markov);

noodles.chase.call(markov, noodles);
noodles.chase.apply(markov, [noodles]);