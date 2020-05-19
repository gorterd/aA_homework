import React from "react";


class Calculator extends React.Component {

  constructor(props){
    super(props);

    this.state = {
      num1: "",
      num2: "",
      result: 0
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.reset = this.reset.bind(this);
  }

  setNum1(e){
    this.setState({num1: e.currentTarget.value});
  }

  setNum2(e){
    this.setState({num2: e.currentTarget.value});
  }

  add(e){
    e.preventDefault();

    let {int1, int2} = this._parse();
    this.setState({result: int1 + int2})
  }
  
  subtract(e){
    e.preventDefault();

    let {int1, int2} = this._parse();
    this.setState({result: int1 - int2})
  }

  multiply(e){
    e.preventDefault();

    let {int1, int2} = this._parse();
    this.setState({result: int1 * int2})
  }

  divide(e){
    e.preventDefault();

    let {int1, int2} = this._parse();
    this.setState({result: int1 / int2})
  }

  reset(e){
    e.preventDefault();

    this.setState({ 
      num1: "", 
      num2: "", 
      result: 0
    });
  }

  render() {
    let {num1, num2, result} = this.state;
    let {setNum1, setNum2, add, subtract, multiply, divide, reset} = this;

    return (
      <div className="calculator-container">
          <h1>{result}</h1> 
          
          <div className="operands">
            <input name="num1" type="text" onChange={setNum1} value={num1} autoFocus/>
            
            <input name="num2" type="text" onChange={setNum2} value={num2} />
          </div>

          <div className="operation-buttons">
            <button onClick={add}><i className="fas fa-plus"/></button>
            <button onClick={subtract}><i className="fas fa-minus"/></button>
            <button onClick={multiply}><i className="fas fa-times"/></button>
            <button onClick={divide}><i className="fas fa-divide"/></button>
          </div>

          <button className="reset" onClick={reset}>clear</button>
      </div>
    );
  }

  _parse() {
    let {num1, num2} = this.state;
    let [int1, int2] = [num1, num2].map( n => parseInt(n) );
    return {int1, int2};
  }
}

export default Calculator;

    
