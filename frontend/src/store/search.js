// import { useDispatch } from "react-redux";
import csrfFetch from "./csrf";
// import { Dispatch } from "react";

export const RECEIVE_SEARCH = 'searches/RECEIVE_SEARCH';
export const RECEIVE_SEARCHES = 'searches/RECEIVE_SEARCHES';
export const REMOVE_SEARCH = 'searches/REMOVE_SEARCH';


const receiveSearch = search => ({
    type: RECEIVE_SEARCH,
    search
})

const receiveSearches = searches => ({
    type: RECEIVE_SEARCHES,
    searches
})

const removeSearch = searchId => ({
    type: REMOVE_SEARCH,
    searchId
})


// export const receiveSearchResults = searchResults => ({
//     type: GET_SEARCH_RESULTS,
//     searchResults
// })

// export const clearSearchResults = () => ({
//     type: CLEAR_SEARCH_RESULTS
// })

export const getSearch = searchId => state => {
    return state.searches ? state.search[searchId] : null;
}

export const getSearches = state => {
    return state.search ? Object.values(state.search) : [];
}

// const fetchSearchResults = (query) => async dispatch => {
    
// }

export const fetchSearch = searchId => async dispatch => {
    const response = await csrfFetch(`/api/searches/${searchId}`)

    if (response.ok) {
        const search = await response.json();
        dispatch(receiveSearch(search))
    }
}

export const fetchSearches = () => async dispatch => {
    const response = await csrfFetch('/api/searches')

    if (response.ok) {
        const searches = await response.json();
        dispatch(receiveSearches(searches))
    }
}

export const createSearch = search => async dispatch => {

    const response = await csrfFetch('/api/searches', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(search)
    })
   
    if (response.ok) {
        const search = await response.json();
        dispatch(receiveSearch(search))
    } 
}

export const updateSearch = search => async dispatch => {
    const response = await csrfFetch(`/api/searches/${search.id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(search)
    })
    if (response.ok) {
        const search = await response.json();
        dispatch(receiveSearch(search))
    }
}

export const deleteSearch = searchId => async dispatch => {
    const response = await csrfFetch(`/api/searches/${searchId}`, {
        method: 'DELETE'
    })
    if (response.ok) {
        dispatch(removeSearch(searchId))
    }
}

const searchReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_SEARCH:
            return {...state, [action.search.id]: action.search}
        case RECEIVE_SEARCHES:
            return {...action.searches}
        case REMOVE_SEARCH:
            const newState = {...state}
            delete newState[action.searchId]
            return newState
        default: 
            return state
    }
}

export default searchReducer;
