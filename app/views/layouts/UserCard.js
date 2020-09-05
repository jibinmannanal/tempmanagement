import React, { Component } from "react";
import 'react-bootstrap/dist/react-bootstrap';
import USERIAMGE from "../../../images/user1.png";
import Modal from './Modal'
import ConfirmationModal from "../../app/ConfirmationModal";
import { connect } from "react-redux";
import { CONFIRMATION_MODAL_CONTENT_CONSTANTS } from '../../../constants/AppConstants';
class UserCard extends Component {
    constructor(props)
    {

      super(props);
      this.state = {
           visible: false,
           open: false
       }
       this.user = props.auth.user
       this.user_roles = props.auth.user.roles;


       this.showModal = this.showModal.bind(this);
       this.hideModal = this.hideModal.bind(this);
        this.deleteUser = this.deleteUser.bind(this);

    }
    click = () => {
         this.props.deleteUser();
     }
     showModal () {

       this.setState({visible: true});
   }
   hideModal () {
       this.setState({visible: false});
   }
   deleteUser() {
     // this.props.delete
     // alert(React.findDOMNode(this.refs.pickMe))
   }
   componentWillReceiveProps(nextProps) {

   this.setState({visible: false});
   }
   handleClick = () => {
     if (this.state.open) {
       this.setState({
         open: false,
       });
     } else {
       this.setState({
         open: true,
       });
     }
   }
    render()
    {
        return (
            <>
            <div className={"content_item usercard " + (this.state.open ? "expand" : "")}>
              <header className = "UMCardsHeader">
                <span>{this.props.user_name}

                </span>
                <div>
                { this.user.id != this.props.id && (this.user_roles.includes('writeusers') || this.user_roles.includes('superadmin')) &&
                         <div class="content_item__edit" onClick={() => this.props.onEdit(this.props.id)}>
                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
             <path fill-rule="evenodd" d="M5.707 13.707a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391L10.086 2.5a2 2 0 0 1 2.828 0l.586.586a2 2 0 0 1 0 2.828l-7.793 7.793zM3 11l7.793-7.793a1 1 0 0 1 1.414 0l.586.586a1 1 0 0 1 0 1.414L5 13l-3 1 1-3z"/>
             <path fill-rule="evenodd" d="M9.854 2.56a.5.5 0 0 0-.708 0L5.854 5.855a.5.5 0 0 1-.708-.708L8.44 1.854a1.5 1.5 0 0 1 2.122 0l.293.292a.5.5 0 0 1-.707.708l-.293-.293z"/>
             <path d="M13.293 1.207a1 1 0 0 1 1.414 0l.03.03a1 1 0 0 1 .03 1.383L13.5 4 12 2.5l1.293-1.293z"/>
           </svg></div>}
                { this.user.id != this.props.id && (this.user_roles.includes('writeusers') || this.user_roles.includes('superadmin')) &&
                  <div class="content_item__delete" onClick={this.showModal}>
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor">
                      <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                      <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                    </svg>
                  </div>}
                </div>
              </header>
              <article style = {{marginTop : "9px"}}     >
                  {!this.props.image &&
                    <svg width="9em" height="9em" margin-top="8px " viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
        <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
        <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
      </svg>}
                {this.props.image &&
                   <input type="image" alt="user image" id="card_image" src= {this.props.image  }></input>}
              </article>
              <header className = "UMCardsHeader" style = {{display : this.state.open ? "block" : "none"}} >
                <span>


                          <span>  First Name: {this.props.first_name}  </span>
                  <span>  Last Name: {this.props.last_name}  </span>
                    <span>  Email: {this.props.email}  </span>
                </span>

  {this.props.roles.length > 0 && <h8>Roles</h8>}
                  <span>
                    {this.props.roles.map(role => (

                            <span>  {role['name']   }   </span>
                      ))
                    }
                  </span>

    </header>
              <footer>
                <a href="javascript:void(0);"   onClick={this.handleClick}>{this.state.open ? "Hide details" : "View details"}</a>
              </footer>

            </div>
            {/* <Modal visible={this.state.visible}>
              <p className="dialog__txt">
              Are you sure to delete?                               </p>
              <div class="dialog__txt">
                <button type="button" className="success_button" onClick={() => this.props.onDelete(this.props.id)}>OK</button>

                <button type="button" onClick={this.hideModal} className="cancel_button">
                Cancel
                </button>
              </div>
            </Modal> */}
            {this.state.visible && <ConfirmationModal  centered = {true} modalContent = {CONFIRMATION_MODAL_CONTENT_CONSTANTS.UM_DELETE_USER} onYesCliked = {() => this.props.onDelete({id:this.props.id,name:this.props.user_name})} onCancelCliked = {this.hideModal}></ConfirmationModal>}
            </>
        );
    }
}

  const mapStateToProps = state => ({
    auth: state.auth,


  });
  export default connect(
    mapStateToProps
  )(UserCard);
