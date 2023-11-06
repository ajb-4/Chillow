import ReactDOM from 'react-dom';
import './ShowModal.css';

const ShowModal = ({open, children, onClose, modalStyle}) => {

if (!open) return null;

    return ReactDOM.createPortal(
        <>
        <div id="modaloverlay" onClick={onClose}></div>
        <div id={modalStyle}>
            <button onClick={onClose} id="closeshowmodal">X</button>
            {children}
        </div>
           
        </>,
        document.getElementById('portal')
    )
}

export default ShowModal;