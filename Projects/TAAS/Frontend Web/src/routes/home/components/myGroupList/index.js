import CardGroup from '../../../../components/cardgroup'
import { useAxiosFunction } from '../../../../hooks/useAxiosFunction'
import axios from '../../../../api/graphql'
import { graphQlQuery } from '../../../../api/util'
import LoadingContent from '../loading'
import { useDispatch, useSelector } from 'react-redux'
import { useEffect } from 'preact/hooks'
import { notifyError } from '../../../../store/actions/notify'

const GET_GROUPS =
    'query GetGroups { me { firstName, lastName, groups { id, title, description, members { id }, areaOfInterest } } }'

const MyGroupList = () => {
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
        const { firstName, lastName, groups } = response.data.me
        const ownerName = firstName + (lastName ? ` ${lastName}` : '')

        return groups.map((item) => (
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
        ))
    }

    return <LoadingContent />
}

export default MyGroupList
