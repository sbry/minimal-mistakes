---
title: "React - my Second Session"
published: false
layout: single
date: 2016-09-28 01:17:30
---

> Und niemals vergessen: Das ist alle clientseitig.


# Creating Elements #

React introduces three ways to create elements:

``` javascript
// create element
React.createElement("ul", {className: "my-items"}, ... )
// create factory
React.DOM.ul({className: "my-items"}, ... )
// jsx
<ul class="my-items">...</ul>
```

> Since class is a reserved word in JavaScript, className is used to define the class attribute instead.

`this.props` is a special attribute.

# Creating Components #

There are three ways to create Components as well:


``` javascript
// React Factory-Constructor
React.createClass({...})
// ES6 Class-Definition
class TestComponent extends React.Component {...}
// or just a function
() => {
return <h1>Hallo</h1>
}
```

The Factory-Construction is the best for now because the ancillary options like defaults and (type-)validators, can be added directly and not afterwards.


# How do form-components interact and with what? #


`refs` two-way data binding means there is a callback passed in that gets called with the values.

And then there is `this.state` possibly does not work in stateless functions.

> Stateless functional components are meant to be the children of more complex, stateful components.



> try to keep as many of your components as possible stateless

in any case `this.setState({}), getDefaultProps() getInitialState() ` is builtin.

it seems props and state are complementary: props are the constructor-data and state is what happens to the component.



> After every setState call, the render function is called, updating the state with the new UI.



When parent components instantiate child components they can pass a bound method for the child-component to change State on the Parent-Component.

This is the perfect delegation: You give the subordinate your phone, to call you when he is done.

The Question remains to me: Why do we have to bind even local callbacks?[^1]












[^1]: in fact it's ot super-important to find out right now, but soon I will be interested. I guess callbacks have to be bound because of the setState(); and otherwise the this might refer to the function(){};
