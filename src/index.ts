import schema from '../swagger.json'
import {Collect} from "@supercharge/collections";



interface PathRes {
    response: object
    identifiers: Paramaters[]
}

interface Paramaters {
    name: string
    valType: string
    comment: string | null | undefined
}

const copyIdentifiers = (path: string): Paramaters[] => {
    // console.log(path)
    let res: Paramaters[] = []
    const parts = path.split('/')
    for (let i = 0; i < parts.length; i++) {
        const part = parts[i]
        if (part.startsWith('{') && part.endsWith('}')) {
            const name = part.replace(/[{}]/g, '')
            // console.log(name)
            res.push(getInputType(name))
        }
    }
    return res
}

const getInputType = (name: string): Paramaters => {

    let v = ''

    switch (name) {
        case 'character_id':
            v = 'smallint'
            break
        case 'corporation_id':
            v = 'smallint'
            break
        case 'alliance_id':
            v = 'smallint'
            break
        case 'faction_id':
            v = 'smallint'
            break
        case 'type_id':
            v = 'smallint'
            break
        case 'system_id':
            v = 'smallint'
            break
        case 'region_id':
            v = 'smallint'
            break
        case 'constellation_id':
            v = 'smallint'
            break
        case 'category_id':
            v = 'smallint'
            break
        case 'group_id':
            v = 'smallint'
            break
        case 'solar_system_id':
            v = 'smallint'
            break
        case 'planet_id':
            v = 'smallint'
            break
        case 'moon_id':
            v = 'smallint'
            break
        case 'asteroid_belt_id':
            v = 'smallint'
            break
        case 'stargate_id':
            v = 'smallint'
            break
        case 'station_id':
            v = 'smallint'
            break
        case 'structure_id':
            v = 'smallint'
            break
        case 'contract_id':
            v = 'smallint'
            break
        case 'star_id':
            v = 'smallint'
            break
        case 'war_id':
            v = 'smallint'
            break
        case 'fleet_id':
            v = 'smallint'
            break
        case 'item_id':
            v = 'smallint'
            break
        case 'division':
            v = 'smallint'
            break
        case 'event_id':
            v = 'smallint'
            break
        case 'mail_id':
            v = 'smallint'
            break
        case 'observer_id':
            v = 'smallint'
            break
        case 'starbase_id':
            v = 'smallint'
            break
        case 'attribute_id':
            v = 'smallint'
            break
        case 'effect_id':
            v = 'smallint'
            break
        case 'killmail_id':
            v = 'smallint'
            break
        case 'killmail_hash':
            v = 'text'
            break
        case 'market_group_id':
            v = 'smallint'
            break
        case 'task_id':
            v = 'smallint'
            break
        case 'origin':
            v = 'smallint'
            break
        case 'destination':
            v = 'smallint'
            break
        case 'graphic_id':
            v = 'smallint'
            break
        case 'schematic_id':
            v = 'smallint'
            break
        default:
            v = 'fix me!'
    }

    return {
        name: name,
        valType: v,
        comment: undefined
    }
}

const convertType = (type: string): string => {
    switch (type) {
        case 'int32':
            return 'smallint'
        case 'int64':
            return 'bigint'
        case 'string':
            return 'text'
        case 'float64':
            return 'numeric'
        case 'float32':
            return 'numeric'
        case 'decimal':
            return 'numeric'
        case 'object':
            return 'jsonb'
        default:
            return type
    }
}

const getParams = (params: object): Paramaters[] => {
    let res: Paramaters[] = []
    for (let param in params) {
        res.push({
            name: param,
            valType: convertType(params[param].type),
            comment: params[param].description
        })
    }
    // console.log(res)
    return res
}

const getPathItems = (schema: any, path: string): PathRes => {
    let p = schema.paths[path]

    try {

        if (p.hasOwnProperty('get')) {
            // return p.get.responses['200'].schema.items.properties

            // console.log(p.get.parameters)

            const ids = [...copyIdentifiers(path)]
            // const ids = [...getParams(p.get.parameters), ...copyIdentifiers(path)]

            return {
                response: p.get.responses['200'],
                identifiers: ids
            }
        }
    } catch (e) {
        // console.log(e)
        // console.log('skipping action only path ' + path)
        // console.log(p)
        return {} as PathRes
    }
    return {} as PathRes
}

const ingoreRoutes: string[] = [
    '/alliances/',
    '/dogma/attributes/',
    '/dogma/effects/',
    '/insurance/prices/',
    '/corporations/{corporation_id}/killmails/recent/',
    '/characters/{character_id}/killmails/recent/',
    '/markets/groups/',
    '/opportunities/groups/',
    '/opportunities/tasks/',
    '/characters/{character_id}/search/',
    '/universe/categories/',
    '/universe/constellations/',
    '/universe/graphics/',
    '/universe/groups/',
    '/universe/regions/',
    '/universe/structures/',
    '/universe/systems/',
    '/universe/types/',
    '/universe/ids/',
    '/universe/names/',
    '/wars/',
    '/wars/{war_id}/killmails/',
    '/corporations/{corporation_id}/assets/locations/',
    '/corporations/{corporation_id}/assets/names/',
    '/characters/{character_id}/mail/labels/{label_id}/',
    '/characters/{character_id}/fittings/{fitting_id}/',
    '/characters/{character_id}/cspa/',
    '/characters/{character_id}/assets/locations/',
    '/characters/{character_id}/assets/names/',
    '/characters/affiliation/',
    '/corporation/{corporation_id}/mining/observers/',
    '/corporations/{corporation_id}/starbases/',
    '/alliances/{alliance_id}/corporations/'
]

const generateTableTemplate = (path: string, res: PathRes, fields: Paramaters[]) => {
    // console.log(path)
    try {
        let {operationId} = schema.paths[path].get
        let tableName = operationId.replace(/get_/g, '')
        tableName = tableName.replace(/_([a-z]+_id|killmail_hash)/g, '')
        if (tableName === 'universe_asteroid_belts_asteroid') {
            tableName = 'universe_asteroid_belts'
        }
        // console.log(tableName)

        let tableTemplate = `CREATE TABLE ${tableName} (` + '\n'

        for (let k of  res.identifiers) {
            tableTemplate += `    ${k.name} ${k.valType},` + '\n'
        }

        for (let p of fields) {
            tableTemplate += `    ${p.name} ${p.valType}, -- ${p.comment}` + '\n'
        }

        tableTemplate += ');'

        console.log(tableTemplate)
    } catch (e) {
        console.log(path + ' | ' + e)
    }
}

for (let path in schema.paths) {
    if (path.startsWith('/route/') || path.startsWith('/ui/') || path.startsWith('/fleets/') || ingoreRoutes.includes(path)) {
        continue
    }
    // console.log(path)
    let res = getPathItems(schema, path)
    // let res: PathRes = {response: {}, identifiers: []}
    let fields: Paramaters[] = []
    if (schema.paths[path].get.responses['200'].schema.hasOwnProperty('properties')) {
        fields = getParams(schema.paths[path].get.responses['200'].schema.properties)
    } else if (schema.paths[path].get.responses['200'].schema.hasOwnProperty('items')) {
        fields = getParams(schema.paths[path].get.responses['200'].schema.items.properties)
    } else {
        console.log('no columns ' + path)
        continue
    }
    // console.log(path)
    // res != null && res.identifiers ? console.log(res.identifiers) : null
    generateTableTemplate(path, res, fields)
    // console.log(schema.paths[path].get.responses['200'].schema.properties)
}

// console.log(schema.paths['/characters/{character_id}/wallet/'].get.responses['200'])