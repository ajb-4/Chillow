
import csrfFetch from "./csrf";

export const RECEIVE_HOME = 'homes/receiveHome';
export const RECEIVE_HOMES = 'homes/receiveHomes';
export const REMOVE_HOME = 'homes/removeHome';

const receiveHome = home => ({
    type: RECEIVE_HOME,
    home
})

const receiveHomes = homes => ({
    type: RECEIVE_HOMES,
    homes
})

const removeHome = homeId => ({
    type: REMOVE_HOME,
    homeId
})

export const getHome = homeId => state => {
    return state.homes ? state.homes[homeId] : null;
}

export const getHomes = state => {
    return state.homes ? Object.values(state.homes) : [];
}

export const fetchHome = (homeId) => async dispatch => {
    const response = await csrfFetch(`/api/homes/${homeId}`)
    
    if (response.ok) {
        const home = await response.json();
        dispatch(receiveHome(home))
    }
}

export const fetchHomes = () => async dispatch => {
    const response = await csrfFetch('/api/homes')

    if (response.ok) {
        const homes = await response.json();
        dispatch(receiveHomes(homes))
    }
}

export const createHome = home => async dispatch => {
    const response = await csrfFetch('/api/homes', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(home)
    })
    if (response.ok) {
        const home = await response.json();
        dispatch(receiveHome(home))
    }
}

export const updateHome = home => async dispatch => {
    const response = await csrfFetch(`/api/homes/${home.id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(home)
    })
    if (response.ok) {
        const home = await response.json();
        dispatch(receiveHome(home))
    }
}

export const deleteHome = homeId => async dispatch => {
    const response = await csrfFetch(`/api/homes/${homeId}`, {
        method: 'DELETE',
     })
     if (response.ok) {
        dispatch(removeHome(homeId))
     }
}

const homesReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_HOME:
            return {...state, [action.home.id]: action.home}
        case RECEIVE_HOMES:
            return {...action.homes}
        case REMOVE_HOME:
            const newState = {...state}
            delete newState[action.homeId]
            return newState
        default:
            return state
    }
}

export default homesReducer;
