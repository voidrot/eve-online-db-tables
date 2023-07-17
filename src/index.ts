import schema from '../swagger.json'



interface PathRes {
    response: object
    identifiers: Parameters[]
}

interface Parameters {
    name: string
    valType: string
    comment: string | null | undefined
}

interface SingleSchema {
    description: string
    format: string
    type: string
    title: string
}

const convertType = (type: string): string => {
    switch (type) {
        case 'int32':
            return 'integer'
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
        case 'double':
            return 'numeric'
        case 'object':
            return 'jsonb'
        case 'array':
            return 'jsonb'
        case 'date':
            return 'timestamptz'
        case 'date-time':
            return 'timestamptz'
        default:
            return type
    }
}

const getColumns = (params: object): Parameters[] => {
    let res: Parameters[] = []
    for (let param in params) {
        res.push({
            name: param,
            valType: params[param].format ? convertType(params[param].format) : convertType(params[param].type),
            comment: params[param].description
        })
    }

    return res
}

const getSingleColumn = (col: SingleSchema): Parameters[] => {
    return [{
        name: col.description.toLowerCase().replace(/ /g, '_'),
        valType: convertType(col.format),
        comment: col.description
    }]
}



const getParams = (params: object): Parameters[] => {
    let res: Parameters[] = []
    for (let param in params) {
        if (params[param].hasOwnProperty('in') && params[param].in === 'path') {
            res.push({
                name: params[param].name,
                valType: convertType(params[param].format),
                comment: params[param].description
            })
        }
    }
    // console.log(res)
    return res
}

const ingoreRoutes: string[] = [
    '/alliances/',
    '/dogma/attributes/',
    '/dogma/effects/',
    '/insurance/prices/',
    '/corporations/{corporation_id}/killmails/recent/',
    '/characters/{character_id}/killmails/recent/',
    '/markets/groups/',
    '/markets/{region_id}/types/',
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

const pgKeyWords: string[] = [
    'from'
]

const fixPGKeyWords = (str: string): string => {
    if (pgKeyWords.some((k) => str === k)) {
        return `_${str}`
    }
    return str
}

const generateTableTemplate = (path: string, ids: Parameters[], fields: Parameters[]) => {
    // console.log(path)
    try {
        let {operationId} = schema.paths[path].get
        let tableName = operationId.replace(/get_/g, '')
        tableName = tableName.replace(/_([a-z]+_id|killmail_hash)/g, '')
        if (tableName === 'universe_asteroid_belts_asteroid') {
            tableName = 'universe_asteroid_belts'
        }
        // console.log(tableName)

        let i = new Set(ids.map((p) => p.name))
        let columns = [...ids, ...fields.filter((p) => !i.has(p.name))]


        let tableTemplate = `CREATE TABLE ${tableName} (` + '\n'

        let colCount = columns.length
        for (let p of columns) {
            tableTemplate += `    ${fixPGKeyWords(p.name)} ${p.valType}${!--colCount ? '' : ','} -- ${p.comment}` + '\n'
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

    const target = schema.paths[path].get
    const targetSchema = target.responses['200'].schema

    const ids = getParams(target.parameters)
    let columns: Parameters[] = []
    if (targetSchema.items?.properties) {
        columns = getColumns(targetSchema.items.properties)
    } else if (targetSchema.properties) {
        columns = getColumns(targetSchema.properties)
    } else {
        columns = getSingleColumn(targetSchema as SingleSchema)
    }
    generateTableTemplate(path, ids, columns)
}

