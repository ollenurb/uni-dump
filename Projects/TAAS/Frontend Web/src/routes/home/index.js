import { useState } from 'preact/hooks'
import { useDispatch } from 'react-redux'

import Modal from '../../components/modal'
import { showModal } from '../../store/actions/modal'

import AllGroupList from './components/allGroupList'
import MyGroupList from './components/myGroupList'

const Home = () => {
    const dispatch = useDispatch()
    const [showMine, setShowMine] = useState(false)

    return (
        <>
            <Modal />
            <div className="py-3 d-flex justify-content-center">
                <div className="px-3 col col-md-8 col-lg-8 col-xl-6">
                    {/* Filters section */}
                    <div className="d-flex flex-row border-bottom align-items-center py-2">
                        <h1 className="m-0 me-auto">{showMine ? 'My' : 'All'} Groups</h1>
                        <button
                            type="button"
                            className="btn btn-primary"
                            onClick={() => dispatch(showModal())}
                        >
                            <i className="fa-solid fa-sharp fa-plus" />
                        </button>
                        <div className="btn-group d-flex ms-1" role="group">
                            <input
                                type="radio"
                                className="btn-check"
                                name="btnradio"
                                id="btnradio1"
                                autocomplete="off"
                                defaultChecked
                                onChange={() => setShowMine(false)}
                            />
                            <label className="btn btn-outline-secondary" for="btnradio1">
                                <i className="fa-solid fa-bars" />
                            </label>
                            <input
                                type="radio"
                                className="btn-check"
                                name="btnradio"
                                id="btnradio3"
                                autocomplete="off"
                                onChange={() => setShowMine(true)}
                            />
                            <label className="btn btn-outline-secondary" for="btnradio3">
                                <i className="fa-solid fa-user" />
                            </label>
                        </div>
                    </div>
                    <div className="row row-cols-1 row-cols-sm-2 row-cols-lg-3 ">
                        {(showMine && <MyGroupList />) || <AllGroupList />}
                    </div>
                </div>
            </div>
        </>
    )
}

export default Home
