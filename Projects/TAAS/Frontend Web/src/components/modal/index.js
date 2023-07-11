import { useSelector, useDispatch } from 'react-redux'
import { hideModal } from '../../store/actions/modal'
import style from './style.scss'
import { useState, useEffect } from 'preact/hooks'
import axios from '../../api/graphql'
import { useAxiosFunction } from '../../hooks/useAxiosFunction'
import { graphQlQuery } from '../../api/util'
import { refreshList } from '../../store/actions/grouplist'

import { notifySuccess, notifyError } from '../../store/actions/notify'

const INSERTGROUP =
    'mutation InsertGroup($groupInput: GroupInput!) {saveGroup(input: $groupInput) {id}}'

const Modal = () => {
    // variables for modal's state
    const dispatch = useDispatch()
    const showModal = useSelector((state) => state.modal.show)

    const closeModal = () => {
        dispatch(hideModal())
    }

    //From state
    const [title, setTitle] = useState()
    const [description, setDescription] = useState()
    const [areaOfInterest, setAreaOfInterest] = useState()

    // Fetch Resource state
    const [response, error, loading, axiosFetch] = useAxiosFunction()

    const handleButtonClick = (e) => {
        e.currentTarget.disabled = true
        e.preventDefault()

        let groupData = {
            title,
            areaOfInterest,
            description,
        }

        axiosFetch({
            axiosInstance: axios,
            url: '/graphql',
            method: 'post',
            requestConfig: graphQlQuery(INSERTGROUP, { groupInput: groupData }),
        })
    }

    useEffect(() => {
        if (response && response.data) {
            dispatch(notifySuccess(`The ${title} group was successfully created`))
            dispatch(refreshList())
            closeModal()
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [response])

    useEffect(() => {
        if (error) {
            dispatch(notifyError(error))
        }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [error])

    return (
        showModal && (
            <div className={`modal d-block ${style.modalOverlay}`}>
                <div className="modal-dialog modal-dialog-centered">
                    <div className="modal-content">
                        <div className="modal-header text-center">
                            <h5 className="modal-title">Insert a new group</h5>
                            <button type="button" onClick={closeModal} className="btn-close" />
                        </div>
                        <div className="modal-body">
                            <div className="mb-3">
                                <label for="exampleFormControlInput1" className="form-label">
                                    Title
                                </label>
                                <input
                                    type="text"
                                    className="form-control"
                                    placeholder="Title"
                                    onChange={(e) => setTitle(e.target.value)}
                                />
                            </div>

                            <div className="mb-3">
                                <label for="exampleFormControlInput1" className="form-label">
                                    Area of interest
                                </label>
                                <select
                                    className="form-select"
                                    onChange={(e) =>
                                        setAreaOfInterest(
                                            e.target.options[e.target.selectedIndex].text
                                        )
                                    }
                                >
                                    <option selected>Miscellaneous</option>
                                    <option value="1">Computer Science</option>
                                    <option value="2">Mathematics</option>
                                    <option value="3">Architecture</option>
                                    <option value="4">Engineering</option>
                                </select>
                            </div>

                            <div className="mb-3">
                                <label for="exampleFormControlTextarea1" className="form-label">
                                    Description
                                </label>
                                <textarea
                                    className="form-control"
                                    id="exampleFormControlTextarea1"
                                    rows="5"
                                    onChange={(e) => setDescription(e.target.value)}
                                />
                            </div>
                        </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button
                                type="button"
                                className="btn btn-overline-primary"
                                onClick={handleButtonClick}
                            >
                                Create
                                {loading && (
                                    <i
                                        className="fa fa-refresh fa-spin"
                                        style={{ marginRight: '5px' }}
                                    />
                                )}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        )
    )
}

export default Modal
