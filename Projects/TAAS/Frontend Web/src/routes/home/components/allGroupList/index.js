import CardGroup from '../../../../components/cardgroup'
import { useAxiosFunction } from '../../../../hooks/useAxiosFunction'
import { useEffect } from 'preact/hooks'
import { useDispatch, useSelector } from 'react-redux'
import axios from '../../../../api/graphql'
import { graphQlQuery } from '../../../../api/util'
import LoadingContent from '../loading'
import { notifyError } from '../../../../store/actions/notify'

const GET_GROUPS =
    'query GetGroups { groups { id, title, description, owner { id, firstName, lastName }, members { id }, areaOfInterest } }'

const AllGroupList = () => {
    const [response, error, , axiosFetch] = useAxiosFunction()

    const refresh = useSelector((state) => state.groupList.refresh)
    useEffect(
        () =>
            axiosFetch({
                axiosInstance: axios,
                url: '/graphql',
                method: 'post',
                requestConfig: graphQlQuery(GET_GROUPS),
            }),
        // eslint-disable-next-line react-hooks/exhaustive-deps
        [refresh]
    )

    const dispatch = useDispatch()
    useEffect(() => {
        if (error) {
            dispatch(notifyError(error))
        }
    }, [error])

    if (response && response.data) {
        return response.data.groups.map(({owner, ...item}) => {
            const ownerName =
                owner.firstName + (owner.lastName ? ` ${owner.lastName}` : '')

            return (
                <div className="mt-4" key={item.id}>
                    <CardGroup
                        id={item.id}
                        title={item.title}
                        owner={ownerName}
                        participants={item.members.length}
                        description={item.description}
                        aoi={item.areaOfInterest}
                    />
                </div>
            )
        })
    }

    return <LoadingContent />
}

export default AllGroupList
