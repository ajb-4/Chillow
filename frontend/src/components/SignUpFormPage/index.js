import { useDispatch, useSelector } from "react-redux";
import { useState } from "react";
import * as sessionActions from "../../store/session"
import './SignUpForm.css';
import { Redirect } from "react-router-dom";

const SignUpFormPage = () => {

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const dispatch = useDispatch();
    const [errors, setErrors] = useState([]);

    const sessionUser = useSelector(state => state.session.user);

    if (sessionUser) return <Redirect to='/' />

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(sessionActions.signup({ email, password }))
        .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
    }

    const hasSymbol = new RegExp('([^A-Za-z0-9])')
    const hasUpAndLow = new RegExp('(?=.*[A-Z])(?=.*[a-z])')
    const hasNumber = new RegExp('(?=.*[0-9])')
    const hasLetter = new RegExp('(?=.*[A-Z])|(?=.*[a-z])')


    
    return (
      <>
        <form onSubmit={handleSubmit} className="signUpFormContainer">
          <ul>
                {errors.map(error => <li key={error}>{error}</li>)}
          </ul>
          <div id="signup-emailcontainer">
          <div id="emaillabel-signup">Email</div>
                <div id="inputfield">
                <input type='text'
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder='Enter email'
                id='emailFieldSignUp'></input>
                </div>
          </div>

          <br></br>
          
          <div id="signup-passwordcontainer">
          <div id="passwordlabel-signup">Password</div>
                <div id="inputfield">
                <input type='password'
                value={password} 
                onChange={(e) => setPassword(e.target.value)}
                placeholder='Create password'
                id='passwordFieldSignUp'></input>
                </div>
          </div>
          <div id="passwordvalidations">
            <p className={password.length < 8 ? 'invalidPassword' : 'validPassword'}>At least 8 characters</p>
            <p className={(hasNumber.test(password) && hasLetter.test(password)) ? 'validPassword' : 'invalidPassword'}>Mix of letters and numbers</p>
            <p className={hasSymbol.test(password) ? 'validPassword' : 'invalidPassword'}>At least 1 special character</p>
            <p className={hasUpAndLow.test(password) ? 'validPassword' : 'invalidPassword'}>At least 1 lowercase letter and 1 uppercase letter</p>
          </div>
          <div id="landlordsignup">
            <input type='checkbox' id="landlordcheckbox"></input>
            <p id="landlordsentence">I am a landlord or industry proffessional</p>
          </div>
          <div id="signupsubmit-container">
            <input type='submit' id="signUpSubmitButton" value='Submit'></input>
          </div>
          <p id="termsofuse">By submitting, I accept Chillow's terms of use.</p>
         
        </form>
      </>
    )
}

export default SignUpFormPage;