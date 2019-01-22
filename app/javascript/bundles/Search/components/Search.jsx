import React, { Component } from 'react';
import axios from 'axios';

export default class Search extends Component {
  state = { term: "", results: [] }

  handleChange = event => {
    const term = event.target.value.trim();
    axios.get(`/search.json?term=${term}`)
      .then((response) => {
        this.setState({ term, results: response.data });
      })
      .catch((error) => {
        console.log(error.response);
      })
  }

  render(){
    const { results, term } = this.state;
    return(
      <div>
        <label htmlFor="term">Search</label>
        <input
          type="search"
          name="term"
          value={ term }
          onChange={ this.handleChange }
        />
        {results.length > 0 && term.length > 0 &&
          <div>
            <h3>Results</h3>
            {
              results.map((result, i) => {
                return(
                  <p key={i}>
                    <a href={result.location}>
                      {result.name}
                    </a>
                  </p>
                );
              })
            }
          </div>
        }
      </div>
    );
  }
}
