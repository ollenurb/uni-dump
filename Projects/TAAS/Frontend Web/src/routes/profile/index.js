// SASS style
import style from './style.scss'
import CardGroup from '../../components/cardgroup'

const Profile = () => (
    <div className="d-flex flex-row flex-grow-1">
        <div className={style.page}>
            <div className={style.profile}>
                <div className={style.banner} />
                <div className={style.info}>
                    <div className={style.image} />
                    <h2>Mario Rossi</h2>
                    <span>CEO at CulettoRosso SRL</span>
                </div>
                <div className="d-flex pt-3 justify-content-center">
                    <h1>About my groups:</h1>
                </div>
            </div>
            <div className="container-fluid">
                <div className="row row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                    <div className="col mt-4">
                        <CardGroup
                            name="GigaChad"
                            owner="GigaMatteo"
                            numPart="3"
                            vote="10"
                            groupLink=""
                        />
                    </div>
                    <div className="col mt-4">
                        <CardGroup
                            name="GigaChad"
                            owner="GigaMatteo"
                            numPart="3"
                            vote="10"
                            groupLink=""
                        />
                    </div>
                    <div className="col mt-4">
                        <CardGroup
                            name="GigaChad"
                            owner="GigaMatteo"
                            numPart="3"
                            vote="10"
                            groupLink=""
                        />
                    </div>
                    <div className="col mt-4">
                        <CardGroup
                            name="GigaChad"
                            owner="GigaMatteo"
                            numPart="3"
                            vote="10"
                            groupLink=""
                        />
                    </div>
                    <div className="col mt-4">
                        <CardGroup
                            name="GigaChad"
                            owner="GigaMatteo"
                            numPart="3"
                            vote="10"
                            groupLink=""
                        />
                    </div>
                </div>
            </div>
        </div>
    </div>
)
export default Profile
