import csrfFetch from "./csrf";

export const RECEIVE_LIKE = 'likes/receiveLike';
export const RECEIVE_LIKES = 'likes/receiveLikes';
export const REMOVE_LIKE = 'likes/removeLike';

const receiveLike = like => ({
    type: RECEIVE_LIKE,
    like
})

const receiveLikes = likes => ({
    type: RECEIVE_LIKES,
    likes
})

const removeLike = likeId => ({
    type: REMOVE_LIKE,
    likeId
})

export const getLike = likeId => state => {
    return state.likes ? state.likes[likeId] : null;
}

export const getLikes = state => {
    return state.likes ? Object.values(state.likes) : [];
}

export const createLike = like => async dispatch => {
    try {
        const response = await csrfFetch('/api/likes', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(like)
        });

        if (response.ok) {
            const newLike = await response.json();
            dispatch(receiveLike(newLike));
        }
    } catch (error) {
        console.error('Error creating like:', error);
    }
};

export const fetchLikes = () => async dispatch => {
    const response = await csrfFetch('/api/likes')

    if (response.ok) {
        const likes = await response.json();
        dispatch(receiveLikes(likes))
    }
}

export const deleteLike = likeId => async dispatch => {
    debugger
    const response = await csrfFetch(`/api/likes/${likeId}`, {
        method: 'DELETE'
    })
    if (response.ok) {
        dispatch(removeLike(likeId));
    }
};

// const likesReducer = (state = {}, action) => {
//     let newState = {...state};
//     switch (action.type) {
//         case RECEIVE_LIKE:
//             newState[action.like.id] = action.like ;
//             return newState
//         case RECEIVE_LIKES:
//             return { ...state, ...action.likes };
//         case REMOVE_LIKE:
//             delete newState[action.likeId];
//             return newState;
//         default:
//             return state;
//     }
// }

const likesReducer = (state = {}, action) => {
    let newState = { ...state };
    switch (action.type) {
        case RECEIVE_LIKE:
            newState[action.like.id] = action.like;
            return newState;
        case RECEIVE_LIKES:
            action.likes.forEach((like) => {
                newState[like.id] = like;
            });
            return newState;
        case REMOVE_LIKE:
            delete newState[action.likeId];
            return newState;
        default:
            return state;
    }
};

export default likesReducer;