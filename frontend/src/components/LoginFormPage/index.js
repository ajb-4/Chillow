import {Redirect} from 'react-router-dom';
import * as sessionActions from '../../store/session';
import {useDispatch, useSelector} from 'react-redux';
import { useState } from 'react';
import './LoginForm.css';

const LoginFormPage = () => {


const [email, setEmail] = useState('');
const [password, setPassword] = useState('');
const [errors, setErrors] = useState([]);
const dispatch = useDispatch();
const sessionUser = useSelector(state => state.session.user);


if (sessionUser) return <Redirect to="/" />;

const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.loginUser({ email, password }))
      .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors("Incorrect email or password. Please try again or click 'Forgot your password?'.");
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
}

const handleDemoLogin = () => {
  setErrors([]);
  return dispatch(sessionActions.loginUser({ email: 'demo@gmail.com', password: 'Password$1' }))
    .catch(async (res) => {
      let data;
      try {
        data = await res.clone().json();
      } catch {
        data = await res.text();
      }
      if (data?.errors) setErrors("Incorrect email or password. Please try again or click 'Forgot your password?'.");
      else if (data) setErrors([data]);
      else setErrors([res.statusText]);
    });
}
    return (
        <form onSubmit={handleSubmit} className="signInFormContainer">          
            <ul>
                {/* {errors.map(error => <li key={error}>{error}</li>)} */}
            </ul>
            <div id="signin-emailcontainer">
            <div id="emaillabel-signin">Email</div>
                <div id="inputfield">
                <input type='text'
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder='Enter email'
                id='emailFieldSignIn'></input>
                </div>
            </div>

            <br></br>

            <div id="signin-passwordcontainer">
            <div id="passwordlabel-signin">Password</div>
                <div id="inputfield">
                <input type='password'
                value={password} 
                onChange={(e) => setPassword(e.target.value)}
                placeholder='Enter password'
                id='passwordFieldSignIn'></input>
                </div>
            </div>
            <div id="signinsubmit-container">
              <input type='submit' value='Sign in' id='signInButton'></input>
            </div>
            <div id="demouserlogincontainer">
              <div id='demouserlogin' onClick={handleDemoLogin}>Demo User</div>
            </div>
            <div id="errors">
                <p id="errormessage">{errors}</p>
            </div>
        </form>
    )
}

export default LoginFormPage;