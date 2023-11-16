import csrfFetch from "./csrf";

export const GET_FILTER_RESULTS = 'filter/getFilterResults';
export const CLEAR_FILTER_RESULTS = 'filter/clearFilterResults';

const getFilterResults = filterResults => ({
    type: GET_FILTER_RESULTS,
    filterResults
})

const clearFilterResults = () => ({
    type: CLEAR_FILTER_RESULTS
})

export const getFilters = state => {
    return state.filter ? Object.values(state.filter) : [];
}

export const fetchFilterResults = query => async dispatch => {
    debugger
    const response = await csrfFetch(`/api/homes/search?query=${query}`)

    if (response.ok) {
        const homes = await response.json();
        dispatch(getFilterResults(homes))
    }
}

const filterReducer = (state = {}, action) => {
    switch (action.type) {
        case GET_FILTER_RESULTS: 
            return { ...action.filterResults }
        case CLEAR_FILTER_RESULTS: 
            return {};
        default:
            return state;
    }
}

export default filterReducer;