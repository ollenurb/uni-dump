import { Link } from 'preact-router'
import style from './style.scss'

// Import images
import biology from './img/biology.jpg'
import cs from './img/cs.jpg'
import eng from './img/eng.jpg'
import literature from './img/literature.jpg'
import mathematics from './img/math.jpg'
import other from './img/other.jpg'

const AoiImg = (aoi) => {
    switch (aoi) {
        case 'Other':
            return other

        case 'Biology':
            return biology

        case 'Engineering':
            return eng

        case 'Computer Science':
            return cs

        case 'Mathematics':
            return mathematics

        case 'Literature':
            return literature
    }
}

const CardGroup = ({ id, title, owner, participants, description, aoi }) => (
    <div className="card shadow h-100">
        <div className="bg-secondary card-img-top">
            <h2 className={`text-white text-truncate text-center ${style['image-text-overlay']}`}>
                {aoi}
            </h2>
            <img
                src={AoiImg(aoi)}
                className="w-100 card-img-top"
                alt=""
                style="opacity: 0.3; height: 10em;"
            />
        </div>

        <div className="card-body">
            <h3 className="card-title">{title}</h3>
            <h5 className="card-subtitle">
                Owner: <span className="text-muted">{owner}</span>
            </h5>
            <h5 className="card-subtitle my-2 ">
                Participants: <span className="text-muted">{participants}</span>
            </h5>
            <p className={`card-text text-break ${style.vclamp}`}>{description}</p>
        </div>

        <div className="card-footer bg-white pb-4 border-top-0">
            <div className="row">
                <div className="col">
                    <a className="btn btn-outline-primary w-100 fw-bold" href="#">
                        JOIN
                    </a>
                </div>
                <div className="col">
                    <Link className="btn btn-outline-primary w-100 fw-bold" href={`/group/${id}`}>
                        SEE MORE
                    </Link>
                </div>
            </div>
        </div>
    </div>
)

export default CardGroup
