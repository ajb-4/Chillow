import ReactDOM from 'react-dom';
import './Modal.css';

const Modal = ({open, children, onClose, modalStyle}) => {

if (!open) return null;

    return ReactDOM.createPortal(
        <>
        <div id="modaloverlay" onClick={onClose}></div>
        <div id={modalStyle}>
            <button onClick={onClose} id="closemodal">X</button>
            {children}
        </div>
           
        </>,
        document.getElementById('portal')
    )
}

export default Modal;