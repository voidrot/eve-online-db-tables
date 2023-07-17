CREATE TABLE alliances
(
    alliance_id             integer,     -- ID of the alliance
    creator_corporation_id  integer,     -- ID of the corporation that created the alliance
    creator_id              integer,     -- ID of the character that created the alliance
    date_founded            timestamptz, -- date_founded string
    executor_corporation_id integer,     -- the executor corporation ID, if this alliance is not closed
    faction_id              integer,     -- Faction ID this alliance is fighting for, if this alliance is enlisted in factional warfare
    name                    text,        -- the full name of the alliance
    ticker                  text         -- the short name of the alliance
);
CREATE TABLE alliances_contacts
(
    alliance_id             integer,     -- ID of the alliance
    contact_id   integer, -- contact_id integer
    contact_type text,    -- contact_type string
    label_ids    jsonb,   -- label_ids array
    standing     float    -- Standing of the contact
);
CREATE TABLE alliances_contacts_labels
(
    alliance_id             integer,     -- ID of the alliance
    label_id   bigint, -- label_id integer
    label_name text    -- label_name string
);
CREATE TABLE alliances_icons
(
    alliance_id             integer,     -- ID of the alliance
    px128x128 text, -- px128x128 string
    px64x64   text  -- px64x64 string
);
CREATE TABLE characters
(
    character_id    integer,     -- The character's ID
    alliance_id     integer,     -- The character's alliance ID
    birthday        timestamptz, -- Creation date of the character
    bloodline_id    integer,     -- bloodline_id integer
    corporation_id  integer,     -- The character's corporation ID
    description     text,        -- description string
    faction_id      integer,     -- ID of the faction the character is fighting for, if the character is enlisted in Factional Warfare
    gender          text,        -- gender string
    name            text,        -- name string
    race_id         integer,     -- race_id integer
    security_status float,       -- security_status number
    title           text         -- The individual title of the character
);
CREATE TABLE characters_agents_research
(
    character_id    integer,     -- The character's ID
    agent_id         integer,    -- agent_id integer
    points_per_day   float,      -- points_per_day number
    remainder_points float,      -- remainder_points number
    skill_type_id    integer,    -- skill_type_id integer
    started_at       timestamptz -- started_at string
);
CREATE TABLE characters_assets
(
    character_id    integer,     -- The character's ID
    is_blueprint_copy boolean, -- is_blueprint_copy boolean
    is_singleton      boolean, -- is_singleton boolean
    item_id           bigint,  -- item_id integer
    location_flag     text,    -- location_flag string
    location_id       bigint,  -- location_id integer
    location_type     text,    -- location_type string
    quantity          integer, -- quantity integer
    type_id           integer  -- type_id integer
);
CREATE TABLE characters_attributes
(
    character_id    integer,     -- The character's ID
    accrued_remap_cooldown_date timestamptz, -- Neural remapping cooldown after a character uses remap accrued over time
    bonus_remaps                integer,     -- Number of available bonus character neural remaps
    charisma                    integer,     -- charisma integer
    intelligence                integer,     -- intelligence integer
    last_remap_date             timestamptz, -- Datetime of last neural remap, including usage of bonus remaps
    memory                      integer,     -- memory integer
    perception                  integer,     -- perception integer
    willpower                   integer      -- willpower integer
);
CREATE TABLE characters_blueprints
(
    character_id    integer,     -- The character's ID
    item_id             bigint,  -- Unique ID for this item.
    location_flag       text,    -- Type of the location_id
    location_id         bigint,  -- References a station, a ship or an item_id if this blueprint is located within a container. If the return value is an item_id, then the Character AssetList API must be queried to find the container using the given item_id to determine the correct location of the Blueprint.
    material_efficiency integer, -- Material Efficiency Level of the blueprint.
    quantity            integer, -- A range of numbers with a minimum of -2 and no maximum value where -1 is an original and -2 is a copy. It can be a positive integer if it is a stack of blueprint originals fresh from the market (e.g. no activities performed on them yet).
    runs                integer, -- Number of runs remaining if the blueprint is a copy, -1 if it is an original.
    time_efficiency     integer, -- Time Efficiency Level of the blueprint.
    type_id             integer  -- type_id integer
);
CREATE TABLE characters_bookmarks
(
    character_id    integer,     -- The character's ID
    bookmark_id integer,     -- bookmark_id integer
    coordinates jsonb,       -- Optional object that is returned if a bookmark was made on a planet or a random location in space.
    created     timestamptz, -- created string
    creator_id  integer,     -- creator_id integer
    folder_id   integer,     -- folder_id integer
    item        jsonb,       -- Optional object that is returned if a bookmark was made on a particular item.
    label       text,        -- label string
    location_id integer,     -- location_id integer
    notes       text         -- notes string
);
CREATE TABLE characters_bookmarks_folders
(
    character_id    integer,     -- The character's ID
    folder_id integer, -- folder_id integer
    name      text     -- name string
);
CREATE TABLE characters_calendar
(
    character_id    integer,     -- The character's ID
    event_date     timestamptz, -- event_date string
    event_id       integer,     -- event_id integer
    event_response text,        -- event_response string
    importance     integer,     -- importance integer
    title          text         -- title string
);
CREATE TABLE characters_calendar
(
    character_id    integer,     -- The character's ID
    event_id   integer,     -- The id of the event requested
    date       timestamptz, -- date string
    duration   integer,     -- Length in minutes
    importance integer,     -- importance integer
    owner_id   integer,     -- owner_id integer
    owner_name text,        -- owner_name string
    owner_type text,        -- owner_type string
    response   text,        -- response string
    text       text,        -- text string
    title      text         -- title string
);
CREATE TABLE characters_calendar_attendees
(
    character_id    integer,     -- The character's ID
    event_id       integer, -- The id of the event requested
    attendee_id   integer, -- The ID of the attendee
    event_response text     -- event_response string
);
CREATE TABLE characters_clones
(
    character_id    integer,     -- The character's ID
    home_location            jsonb,       -- home_location object
    jump_clones              jsonb,       -- jump_clones array
    last_clone_jump_date     timestamptz, -- last_clone_jump_date string
    last_station_change_date timestamptz  -- last_station_change_date string
);
CREATE TABLE characters_contacts
(
    character_id    integer,     -- The character's ID
    contact_id   integer, -- contact_id integer
    contact_type text,    -- contact_type string
    is_blocked   boolean, -- Whether this contact is in the blocked list. Note a missing value denotes unknown, not true or false
    is_watched   boolean, -- Whether this contact is being watched
    label_ids    jsonb,   -- label_ids array
    standing     float    -- Standing of the contact
);
CREATE TABLE characters_contacts_labels
(
    character_id    integer,     -- The character's ID
    label_id   bigint, -- label_id integer
    label_name text    -- label_name string
);
CREATE TABLE characters_contracts
(
    acceptor_id           integer,     -- Who will accept the contract
    assignee_id           integer,     -- ID to whom the contract is assigned, can be alliance, corporation or character ID
    availability          text,        -- To whom the contract is available
    buyout                numeric,     -- Buyout price (for Auctions only)
    collateral            numeric,     -- Collateral price (for Couriers only)
    contract_id           integer,     -- contract_id integer
    date_accepted         timestamptz, -- Date of confirmation of contract
    date_completed        timestamptz, -- Date of completed of contract
    date_expired          timestamptz, -- Expiration date of the contract
    date_issued           timestamptz, -- Сreation date of the contract
    days_to_complete      integer,     -- Number of days to perform the contract
    end_location_id       bigint,      -- End location ID (for Couriers contract)
    for_corporation       boolean,     -- true if the contract was issued on behalf of the issuer's corporation
    issuer_corporation_id integer,     -- Character's corporation ID for the issuer
    issuer_id             integer,     -- Character ID for the issuer
    price                 numeric,     -- Price of contract (for ItemsExchange and Auctions)
    reward                numeric,     -- Remuneration for contract (for Couriers only)
    start_location_id     bigint,      -- Start location ID (for Couriers contract)
    status                text,        -- Status of the the contract
    title                 text,        -- Title of the contract
    type                  text,        -- Type of the contract
    volume                numeric      -- Volume of items in the contract
);
CREATE TABLE characters_contracts_bids
(
    contract_id integer,    -- ID of a contract
    amount      float,      -- The amount bid, in ISK
    bid_id      integer,    -- Unique ID for the bid
    bidder_id   integer,    -- Character ID of the bidder
    date_bid    timestamptz -- Datetime when the bid was placed
);
CREATE TABLE characters_contracts_items
(
    contract_id  integer, -- ID of a contract
    is_included  boolean, -- true if the contract issuer has submitted this item with the contract, false if the isser is asking for this item in the contract
    is_singleton boolean, -- is_singleton boolean
    quantity     integer, -- Number of items in the stack
    raw_quantity integer, -- -1 indicates that the item is a singleton (non-stackable). If the item happens to be a Blueprint, -1 is an Original and -2 is a Blueprint Copy
    record_id    bigint,  -- Unique ID for the item
    type_id      integer  -- Type ID for item
);
CREATE TABLE characters_corporation_history
(
    character_id    integer,     -- The character's ID
    corporation_id integer,    -- corporation_id integer
    is_deleted     boolean,    -- True if the corporation has been deleted
    record_id      integer,    -- An incrementing ID that can be used to canonically establish order of records in cases where dates may be ambiguous
    start_date     timestamptz -- start_date string
);
CREATE TABLE characters_fatigue
(
    character_id    integer,     -- The character's ID
    jump_fatigue_expire_date timestamptz, -- Character's jump fatigue expiry
    last_jump_date           timestamptz, -- Character's last jump activation
    last_update_date         timestamptz  -- Character's last jump update
);
CREATE TABLE characters_fittings
(
    character_id    integer,     -- The character's ID
    description  text,    -- description string
    fitting_id   integer, -- fitting_id integer
    items        jsonb,   -- items array
    name         text,    -- name string
    ship_type_id integer  -- ship_type_id integer
);
CREATE TABLE characters_fleet
(
    character_id    integer,     -- The character's ID
    fleet_id bigint, -- The character's current fleet ID
    role     text,   -- Member’s role in fleet
    squad_id bigint, -- ID of the squad the member is in. If not applicable, will be set to -1
    wing_id  bigint  -- ID of the wing the member is in. If not applicable, will be set to -1
);
CREATE TABLE characters_fw_stats
(
    character_id    integer,     -- The character's ID
    current_rank   integer,     -- The given character's current faction rank
    enlisted_on    timestamptz, -- The enlistment date of the given character into faction warfare. Will not be included if character is not enlisted in faction warfare
    faction_id     integer,     -- The faction the given character is enlisted to fight for. Will not be included if character is not enlisted in faction warfare
    highest_rank   integer,     -- The given character's highest faction rank achieved
    kills          jsonb,       -- Summary of kills done by the given character against enemy factions
    victory_points jsonb        -- Summary of victory points gained by the given character for the enlisted faction
);
CREATE TABLE characters_implants
(
    character_id integer, -- The given character's ID
    implants     jsonb    -- array of implant id's
);
CREATE TABLE characters_industry_jobs
(
    activity_id            integer,     -- Job activity ID
    blueprint_id           bigint,      -- blueprint_id integer
    blueprint_location_id  bigint,      -- Location ID of the location from which the blueprint was installed. Normally a station ID, but can also be an asset (e.g. container) or corporation facility
    blueprint_type_id      integer,     -- blueprint_type_id integer
    completed_character_id integer,     -- ID of the character which completed this job
    completed_date         timestamptz, -- Date and time when this job was completed
    cost                   numeric,     -- The sume of job installation fee and industry facility tax
    duration               integer,     -- Job duration in seconds
    end_date               timestamptz, -- Date and time when this job finished
    facility_id            bigint,      -- ID of the facility where this job is running
    installer_id           integer,     -- ID of the character which installed this job
    job_id                 integer,     -- Unique job ID
    licensed_runs          integer,     -- Number of runs blueprint is licensed for
    output_location_id     bigint,      -- Location ID of the location to which the output of the job will be delivered. Normally a station ID, but can also be a corporation facility
    pause_date             timestamptz, -- Date and time when this job was paused (i.e. time when the facility where this job was installed went offline)
    probability            float,       -- Chance of success for invention
    product_type_id        integer,     -- Type ID of product (manufactured, copied or invented)
    runs                   integer,     -- Number of runs for a manufacturing job, or number of copies to make for a blueprint copy
    start_date             timestamptz, -- Date and time when this job started
    station_id             bigint,      -- ID of the station where industry facility is located
    status                 text,        -- status string
    successful_runs        integer      -- Number of successful runs for this job. Equal to runs unless this is an invention job
);
CREATE TABLE characters_location
(
    character_id    integer,     -- The character's ID
    solar_system_id integer, -- solar_system_id integer
    station_id      integer, -- station_id integer
    structure_id    bigint   -- structure_id integer
);
CREATE TABLE characters_loyalty_points
(
    character_id    integer,     -- The character's ID
    corporation_id integer, -- corporation_id integer
    loyalty_points integer  -- loyalty_points integer
);
CREATE TABLE characters_mail_headers
(
    character_id    integer,     -- The character's ID
    _from      integer,    -- From whom the mail was sent
    is_read    boolean,    -- is_read boolean
    labels     jsonb,      -- labels array
    mail_id    integer,    -- mail_id integer
    recipients jsonb,      -- Recipients of the mail
    subject    text,       -- Mail subject
    timestamp  timestamptz -- When the mail was sent
);
CREATE TABLE characters_mail_labels
(
    character_id    integer,     -- The character's ID
    labels             jsonb,  -- labels array
    total_unread_count integer -- total_unread_count integer
);
CREATE TABLE characters_mail_lists
(
    character_id    integer,     -- The character's ID
    mailing_list_id integer, -- Mailing list ID
    name            text     -- name string
);
CREATE TABLE characters_mail
(
    character_id    integer,     -- The character's ID
    mail_id    integer,    -- An EVE mail ID
    body       text,       -- Mail's body
    _from      integer,    -- From whom the mail was sent
    labels     jsonb,      -- Labels attached to the mail
    read       boolean,    -- Whether the mail is flagged as read
    recipients jsonb,      -- Recipients of the mail
    subject    text,       -- Mail subject
    timestamp  timestamptz -- When the mail was sent
);
CREATE TABLE characters_medals
(
    character_id    integer,     -- The character's ID
    corporation_id integer,     -- corporation_id integer
    date           timestamptz, -- date string
    description    text,        -- description string
    graphics       jsonb,       -- graphics array
    issuer_id      integer,     -- issuer_id integer
    medal_id       integer,     -- medal_id integer
    reason         text,        -- reason string
    status         text,        -- status string
    title          text         -- title string
);
CREATE TABLE characters_mining
(
    character_id    integer,     -- The character's ID
    date            timestamptz, -- date string
    quantity        bigint,      -- quantity integer
    solar_system_id integer,     -- solar_system_id integer
    type_id         integer      -- type_id integer
);
CREATE TABLE characters_notifications
(
    character_id    integer,     -- The character's ID
    is_read         boolean,     -- is_read boolean
    notification_id bigint,      -- notification_id integer
    sender_id       integer,     -- sender_id integer
    sender_type     text,        -- sender_type string
    text            text,        -- text string
    timestamp       timestamptz, -- timestamp string
    type            text         -- type string
);
CREATE TABLE characters_notifications_contacts
(
    character_id    integer,     -- The character's ID
    message             text,        -- message string
    notification_id     integer,     -- notification_id integer
    send_date           timestamptz, -- send_date string
    sender_character_id integer,     -- sender_character_id integer
    standing_level      float        -- A number representing the standing level the receiver has been added at by the sender. The standing levels are as follows: -10 -> Terrible | -5 -> Bad |  0 -> Neutral |  5 -> Good |  10 -> Excellent
);
CREATE TABLE characters_online_history
(
    character_id    integer,     -- The character's ID
    last_login  timestamptz, -- Timestamp of the last login
    last_logout timestamptz, -- Timestamp of the last logout
    logins      integer,     -- Total number of times the character has logged in
    online      boolean      -- If the character is online
);
CREATE TABLE characters_opportunities
(
    character_id    integer,     -- The character's ID
    completed_at timestamptz, -- completed_at string
    task_id      integer      -- task_id integer
);
CREATE TABLE characters_orders
(
    character_id    integer,     -- The character's ID
    duration       integer,     -- Number of days for which order is valid (starting from the issued date). An order expires at time issued + duration
    escrow         numeric,     -- For buy orders, the amount of ISK in escrow
    is_buy_order   boolean,     -- True if the order is a bid (buy) order
    is_corporation boolean,     -- Signifies whether the buy/sell order was placed on behalf of a corporation.
    issued         timestamptz, -- Date and time when this order was issued
    location_id    bigint,      -- ID of the location where order was placed
    min_volume     integer,     -- For buy orders, the minimum quantity that will be accepted in a matching sell order
    order_id       bigint,      -- Unique order ID
    price          numeric,     -- Cost per unit for this order
    range          text,        -- Valid order range, numbers are ranges in jumps
    region_id      integer,     -- ID of the region where order was placed
    type_id        integer,     -- The type ID of the item transacted in this order
    volume_remain  integer,     -- Quantity of items still required or offered
    volume_total   integer      -- Quantity of items required or offered at time order was placed
);
CREATE TABLE characters_orders_history
(
    character_id    integer,     -- The character's ID
    duration       integer,     -- Number of days the order was valid for (starting from the issued date). An order expires at time issued + duration
    escrow         numeric,     -- For buy orders, the amount of ISK in escrow
    is_buy_order   boolean,     -- True if the order is a bid (buy) order
    is_corporation boolean,     -- Signifies whether the buy/sell order was placed on behalf of a corporation.
    issued         timestamptz, -- Date and time when this order was issued
    location_id    bigint,      -- ID of the location where order was placed
    min_volume     integer,     -- For buy orders, the minimum quantity that will be accepted in a matching sell order
    order_id       bigint,      -- Unique order ID
    price          numeric,     -- Cost per unit for this order
    range          text,        -- Valid order range, numbers are ranges in jumps
    region_id      integer,     -- ID of the region where order was placed
    state          text,        -- Current order state
    type_id        integer,     -- The type ID of the item transacted in this order
    volume_remain  integer,     -- Quantity of items still required or offered
    volume_total   integer      -- Quantity of items required or offered at time order was placed
);
CREATE TABLE characters_planets
(
    character_id    integer,     -- The character's ID
    last_update     timestamptz, -- last_update string
    num_pins        integer,     -- num_pins integer
    owner_id        integer,     -- owner_id integer
    planet_id       integer,     -- planet_id integer
    planet_type     text,        -- planet_type string
    solar_system_id integer,     -- solar_system_id integer
    upgrade_level   integer      -- upgrade_level integer
);
CREATE TABLE characters_planets_layout
(
    character_id    integer,     -- The character's ID
    planet_id integer, -- Planet id of the target planet
    links     jsonb,   -- links array
    pins      jsonb,   -- pins array
    routes    jsonb    -- routes array
);
CREATE TABLE characters_portrait
(
    character_id    integer,     -- The character's ID
    px128x128 text, -- px128x128 string
    px256x256 text, -- px256x256 string
    px512x512 text, -- px512x512 string
    px64x64   text  -- px64x64 string
);
CREATE TABLE characters_roles
(
    character_id    integer,     -- The character's ID
    roles          jsonb, -- roles array
    roles_at_base  jsonb, -- roles_at_base array
    roles_at_hq    jsonb, -- roles_at_hq array
    roles_at_other jsonb  -- roles_at_other array
);
CREATE TABLE characters_ship
(
    character_id    integer,     -- The character's ID
    ship_item_id bigint, -- Item id's are unique to a ship and persist until it is repackaged. This value can be used to track repeated uses of a ship, or detect when a pilot changes into a different instance of the same ship type.
    ship_name    text,   -- ship_name string
    ship_type_id integer -- ship_type_id integer
);
CREATE TABLE characters_skillqueue
(
    character_id    integer,     -- The character's ID
    finish_date       timestamptz, -- Date on which training of the skill will complete. Omitted if the skill queue is paused.
    finished_level    integer,     -- finished_level integer
    level_end_sp      integer,     -- level_end_sp integer
    level_start_sp    integer,     -- Amount of SP that was in the skill when it started training it's current level. Used to calculate % of current level complete.
    queue_position    integer,     -- queue_position integer
    skill_id          integer,     -- skill_id integer
    start_date        timestamptz, -- start_date string
    training_start_sp integer      -- training_start_sp integer
);
CREATE TABLE characters_skills
(
    character_id    integer,     -- The character's ID
    skills         jsonb,  -- skills array
    total_sp       bigint, -- total_sp integer
    unallocated_sp integer -- Skill points available to be assigned
);
CREATE TABLE characters_standings
(
    character_id    integer,     -- The character's ID
    from_id   integer, -- from_id integer
    from_type text,    -- from_type string
    standing  float    -- standing number
);
CREATE TABLE characters_titles
(
    character_id    integer,     -- The character's ID
    name     text,   -- name string
    title_id integer -- title_id integer
);
CREATE TABLE characters_wallet
(
    character_id    integer,     -- The character's ID
    wallet_balance numeric -- Wallet balance
);
CREATE TABLE characters_wallet_journal
(
    character_id    integer,     -- ID of the character who owns the wallet
    amount          numeric,     -- The amount of ISK given or taken from the wallet as a result of the given transaction. Positive when ISK is deposited into the wallet and negative when ISK is withdrawn
    balance         numeric,     -- Wallet balance after transaction occurred
    context_id      bigint,      -- An ID that gives extra context to the particular transaction. Because of legacy reasons the context is completely different per ref_type and means different things. It is also possible to not have a context_id
    context_id_type text,        -- The type of the given context_id if present
    date            timestamptz, -- Date and time of transaction
    description     text,        -- The reason for the transaction, mirrors what is seen in the client
    first_party_id  integer,     -- The id of the first party involved in the transaction. This attribute has no consistency and is different or non existant for particular ref_types. The description attribute will help make sense of what this attribute means. For more info about the given ID it can be dropped into the /universe/names/ ESI route to determine its type and name
    id              bigint,      -- Unique journal reference ID
    reason          text,        -- The user stated reason for the transaction. Only applies to some ref_types
    ref_type        text,        -- "The transaction type for the given. transaction. Different transaction types will populate different attributes."
    second_party_id integer,     -- The id of the second party involved in the transaction. This attribute has no consistency and is different or non existant for particular ref_types. The description attribute will help make sense of what this attribute means. For more info about the given ID it can be dropped into the /universe/names/ ESI route to determine its type and name
    tax             numeric,     -- Tax amount received. Only applies to tax related transactions
    tax_receiver_id integer      -- The corporation ID receiving any tax paid. Only applies to tax related transactions
);
CREATE TABLE characters_wallet_transactions
(
    character_id   integer,     -- ID of the character who owns the wallet
    client_id      integer,     -- client_id integer
    date           timestamptz, -- Date and time of transaction
    is_buy         boolean,     -- is_buy boolean
    is_personal    boolean,     -- is_personal boolean
    journal_ref_id bigint,      -- journal_ref_id integer
    location_id    bigint,      -- location_id integer
    quantity       integer,     -- quantity integer
    transaction_id bigint,      -- Unique transaction ID
    type_id        integer,     -- type_id integer
    unit_price     numeric      -- Amount paid per unit
);
CREATE TABLE contracts_public_bids
(
    contract_id integer,    -- ID of a contract
    amount      float,      -- The amount bid, in ISK
    bid_id      integer,    -- Unique ID for the bid
    date_bid    timestamptz -- Datetime when the bid was placed
);
CREATE TABLE contracts_public_items
(
    contract_id         integer, -- ID of a contract
    is_blueprint_copy   boolean, -- is_blueprint_copy boolean
    is_included         boolean, -- true if the contract issuer has submitted this item with the contract, false if the isser is asking for this item in the contract
    item_id             bigint,  -- Unique ID for the item being sold. Not present if item is being requested by contract rather than sold with contract
    material_efficiency integer, -- Material Efficiency Level of the blueprint
    quantity            integer, -- Number of items in the stack
    record_id           bigint,  -- Unique ID for the item, used by the contract system
    runs                integer, -- Number of runs remaining if the blueprint is a copy, -1 if it is an original
    time_efficiency     integer, -- Time Efficiency Level of the blueprint
    type_id             integer  -- Type ID for item
);
CREATE TABLE contracts_public
(
    region_id             integer,     -- An EVE region id
    buyout                numeric,     -- Buyout price (for Auctions only)
    collateral            numeric,     -- Collateral price (for Couriers only)
    contract_id           integer,     -- contract_id integer
    date_expired          timestamptz, -- Expiration date of the contract
    date_issued           timestamptz, -- Сreation date of the contract
    days_to_complete      integer,     -- Number of days to perform the contract
    end_location_id       bigint,      -- End location ID (for Couriers contract)
    for_corporation       boolean,     -- true if the contract was issued on behalf of the issuer's corporation
    issuer_corporation_id integer,     -- Character's corporation ID for the issuer
    issuer_id             integer,     -- Character ID for the issuer
    price                 numeric,     -- Price of contract (for ItemsExchange and Auctions)
    reward                numeric,     -- Remuneration for contract (for Couriers only)
    start_location_id     bigint,      -- Start location ID (for Couriers contract)
    title                 text,        -- Title of the contract
    type                  text,        -- Type of the contract
    volume                numeric      -- Volume of items in the contract
);
CREATE TABLE corporation_mining_extractions
(
    chunk_arrival_time    timestamptz, -- The time at which the chunk being extracted will arrive and can be fractured by the moon mining drill.
    extraction_start_time timestamptz, -- The time at which the current extraction was initiated.
    moon_id               integer,     -- moon_id integer
    natural_decay_time    timestamptz, -- The time at which the chunk being extracted will naturally fracture if it is not first fractured by the moon mining drill.
    structure_id          bigint       -- structure_id integer
);
CREATE TABLE corporation_mining_observers
(
    observer_id             bigint,      -- A mining observer id
    character_id            integer,     -- The character that did the mining
    last_updated            timestamptz, -- last_updated string
    quantity                bigint,      -- quantity integer
    recorded_corporation_id integer,     -- The corporation id of the character at the time data was recorded.
    type_id                 integer      -- type_id integer
);
CREATE TABLE corporations_npccorps
(
    corporation_id integer -- NPC corporation ID
);
CREATE TABLE corporations
(
    corporation_id  integer,     -- The corporation ID
    alliance_id     integer,     -- ID of the alliance that corporation is a member of, if any
    ceo_id          integer,     -- ceo_id integer
    creator_id      integer,     -- creator_id integer
    date_founded    timestamptz, -- date_founded string
    description     text,        -- description string
    faction_id      integer,     -- faction_id integer
    home_station_id integer,     -- home_station_id integer
    member_count    integer,     -- member_count integer
    name            text,        -- the full name of the corporation
    shares          bigint,      -- shares integer
    tax_rate        float,       -- tax_rate number
    ticker          text,        -- the short name of the corporation
    url             text,        -- url string
    war_eligible    boolean      -- war_eligible boolean
);
CREATE TABLE corporations_alliancehistory
(
    corporation_id integer,    -- The corporation ID
    alliance_id    integer,    -- alliance_id integer
    is_deleted     boolean,    -- True if the alliance has been closed
    record_id      integer,    -- An incrementing ID that can be used to canonically establish order of records in cases where dates may be ambiguous
    start_date     timestamptz -- start_date string
);
CREATE TABLE corporations_assets
(
    corporation_id    integer, -- The corporation ID
    is_blueprint_copy boolean, -- is_blueprint_copy boolean
    is_singleton      boolean, -- is_singleton boolean
    item_id           bigint,  -- item_id integer
    location_flag     text,    -- location_flag string
    location_id       bigint,  -- location_id integer
    location_type     text,    -- location_type string
    quantity          integer, -- quantity integer
    type_id           integer  -- type_id integer
);
CREATE TABLE corporations_blueprints
(
    corporation_id      integer, -- The corporation ID
    item_id             bigint,  -- Unique ID for this item.
    location_flag       text,    -- Type of the location_id
    location_id         bigint,  -- References a station, a ship or an item_id if this blueprint is located within a container.
    material_efficiency integer, -- Material Efficiency Level of the blueprint.
    quantity            integer, -- A range of numbers with a minimum of -2 and no maximum value where -1 is an original and -2 is a copy. It can be a positive integer if it is a stack of blueprint originals fresh from the market (e.g. no activities performed on them yet).
    runs                integer, -- Number of runs remaining if the blueprint is a copy, -1 if it is an original.
    time_efficiency     integer, -- Time Efficiency Level of the blueprint.
    type_id             integer  -- type_id integer
);
CREATE TABLE corporations_bookmarks
(
    corporation_id integer,     -- The corporation ID
    bookmark_id    integer,     -- bookmark_id integer
    coordinates    jsonb,       -- Optional object that is returned if a bookmark was made on a planet or a random location in space.
    created        timestamptz, -- created string
    creator_id     integer,     -- creator_id integer
    folder_id      integer,     -- folder_id integer
    item           jsonb,       -- Optional object that is returned if a bookmark was made on a particular item.
    label          text,        -- label string
    location_id    integer,     -- location_id integer
    notes          text         -- notes string
);
CREATE TABLE corporations_bookmarks_folders
(
    corporation_id integer, -- The corporation ID
    creator_id     integer, -- creator_id integer
    folder_id      integer, -- folder_id integer
    name           text     -- name string
);
CREATE TABLE corporations_contacts
(
    corporation_id integer, -- The corporation ID
    contact_id     integer, -- contact_id integer
    contact_type   text,    -- contact_type string
    is_watched     boolean, -- Whether this contact is being watched
    label_ids      jsonb,   -- label_ids array
    standing       float    -- Standing of the contact
);
CREATE TABLE corporations_contacts_labels
(
    corporation_id integer, -- The corporation ID
    label_id       bigint,  -- label_id integer
    label_name     text     -- label_name string
);
CREATE TABLE corporations_containers_logs
(
    corporation_id     integer,     -- The corporation ID
    action             text,        -- action string
    character_id       integer,     -- ID of the character who performed the action.
    container_id       bigint,      -- ID of the container
    container_type_id  integer,     -- Type ID of the container
    location_flag      text,        -- location_flag string
    location_id        bigint,      -- location_id integer
    logged_at          timestamptz, -- Timestamp when this log was created
    new_config_bitmask integer,     -- new_config_bitmask integer
    old_config_bitmask integer,     -- old_config_bitmask integer
    password_type      text,        -- Type of password set if action is of type SetPassword or EnterPassword
    quantity           integer,     -- Quantity of the item being acted upon
    type_id            integer      -- Type ID of the item being acted upon
);
CREATE TABLE corporations_contracts
(
    corporation_id        integer,     -- The corporation ID
    acceptor_id           integer,     -- Who will accept the contract
    assignee_id           integer,     -- ID to whom the contract is assigned, can be corporation or character ID
    availability          text,        -- To whom the contract is available
    buyout                numeric,     -- Buyout price (for Auctions only)
    collateral            numeric,     -- Collateral price (for Couriers only)
    contract_id           integer,     -- contract_id integer
    date_accepted         timestamptz, -- Date of confirmation of contract
    date_completed        timestamptz, -- Date of completed of contract
    date_expired          timestamptz, -- Expiration date of the contract
    date_issued           timestamptz, -- Сreation date of the contract
    days_to_complete      integer,     -- Number of days to perform the contract
    end_location_id       bigint,      -- End location ID (for Couriers contract)
    for_corporation       boolean,     -- true if the contract was issued on behalf of the issuer's corporation
    issuer_corporation_id integer,     -- Character's corporation ID for the issuer
    issuer_id             integer,     -- Character ID for the issuer
    price                 numeric,     -- Price of contract (for ItemsExchange and Auctions)
    reward                numeric,     -- Remuneration for contract (for Couriers only)
    start_location_id     bigint,      -- Start location ID (for Couriers contract)
    status                text,        -- Status of the the contract
    title                 text,        -- Title of the contract
    type                  text,        -- Type of the contract
    volume                numeric      -- Volume of items in the contract
);
CREATE TABLE corporations_contracts_bids
(
    contract_id integer,    -- ID of a contract
    amount      float,      -- The amount bid, in ISK
    bid_id      integer,    -- Unique ID for the bid
    bidder_id   integer,    -- Character ID of the bidder
    date_bid    timestamptz -- Datetime when the bid was placed
);
CREATE TABLE corporations_contracts_items
(
    contract_id  integer, -- ID of a contract
    is_included  boolean, -- true if the contract issuer has submitted this item with the contract, false if the isser is asking for this item in the contract
    is_singleton boolean, -- is_singleton boolean
    quantity     integer, -- Number of items in the stack
    raw_quantity integer, -- -1 indicates that the item is a singleton (non-stackable). If the item happens to be a Blueprint, -1 is an Original and -2 is a Blueprint Copy
    record_id    bigint,  -- Unique ID for the item
    type_id      integer  -- Type ID for item
);
CREATE TABLE corporations_customs_offices
(
    corporation_id              integer, -- The corporation ID
    alliance_tax_rate           float,   -- Only present if alliance access is allowed
    allow_access_with_standings boolean, -- standing_level and any standing related tax rate only present when this is true
    allow_alliance_access       boolean, -- allow_alliance_access boolean
    bad_standing_tax_rate       float,   -- bad_standing_tax_rate number
    corporation_tax_rate        float,   -- corporation_tax_rate number
    excellent_standing_tax_rate float,   -- Tax rate for entities with excellent level of standing, only present if this level is allowed, same for all other standing related tax rates
    good_standing_tax_rate      float,   -- good_standing_tax_rate number
    neutral_standing_tax_rate   float,   -- neutral_standing_tax_rate number
    office_id                   bigint,  -- unique ID of this customs office
    reinforce_exit_end          integer, -- reinforce_exit_end integer
    reinforce_exit_start        integer, -- Together with reinforce_exit_end, marks a 2-hour period where this customs office could exit reinforcement mode during the day after initial attack
    standing_level              text,    -- Access is allowed only for entities with this level of standing or better
    system_id                   integer, -- ID of the solar system this customs office is located in
    terrible_standing_tax_rate  float    -- terrible_standing_tax_rate number
);
CREATE TABLE corporations_divisions
(
    corporation_id integer, -- The corporation ID
    hangar         jsonb,   -- hangar array
    wallet         jsonb    -- wallet array
);
CREATE TABLE corporations_facilities
(
    corporation_id integer, -- The corporation ID
    facility_id    bigint,  -- facility_id integer
    system_id      integer, -- system_id integer
    type_id        integer  -- type_id integer
);
CREATE TABLE corporations_fw_stats
(
    corporation_id integer,     -- The corporation ID
    enlisted_on    timestamptz, -- The enlistment date of the given corporation into faction warfare. Will not be included if corporation is not enlisted in faction warfare
    faction_id     integer,     -- The faction the given corporation is enlisted to fight for. Will not be included if corporation is not enlisted in faction warfare
    kills          jsonb,       -- Summary of kills done by the given corporation against enemy factions
    pilots         integer,     -- How many pilots the enlisted corporation has. Will not be included if corporation is not enlisted in faction warfare
    victory_points jsonb        -- Summary of victory points gained by the given corporation for the enlisted faction
);
CREATE TABLE corporations_icons
(
    corporation_id integer, -- The corporation ID
    px128x128      text,    -- px128x128 string
    px256x256      text,    -- px256x256 string
    px64x64        text     -- px64x64 string
);
CREATE TABLE corporations_industry_jobs
(
    corporation_id         integer,     -- The corporation ID
    activity_id            integer,     -- Job activity ID
    blueprint_id           bigint,      -- blueprint_id integer
    blueprint_location_id  bigint,      -- Location ID of the location from which the blueprint was installed. Normally a station ID, but can also be an asset (e.g. container) or corporation facility
    blueprint_type_id      integer,     -- blueprint_type_id integer
    completed_character_id integer,     -- ID of the character which completed this job
    completed_date         timestamptz, -- Date and time when this job was completed
    cost                   numeric,     -- The sume of job installation fee and industry facility tax
    duration               integer,     -- Job duration in seconds
    end_date               timestamptz, -- Date and time when this job finished
    facility_id            bigint,      -- ID of the facility where this job is running
    installer_id           integer,     -- ID of the character which installed this job
    job_id                 integer,     -- Unique job ID
    licensed_runs          integer,     -- Number of runs blueprint is licensed for
    location_id            bigint,      -- ID of the location for the industry facility
    output_location_id     bigint,      -- Location ID of the location to which the output of the job will be delivered. Normally a station ID, but can also be a corporation facility
    pause_date             timestamptz, -- Date and time when this job was paused (i.e. time when the facility where this job was installed went offline)
    probability            float,       -- Chance of success for invention
    product_type_id        integer,     -- Type ID of product (manufactured, copied or invented)
    runs                   integer,     -- Number of runs for a manufacturing job, or number of copies to make for a blueprint copy
    start_date             timestamptz, -- Date and time when this job started
    status                 text,        -- status string
    successful_runs        integer      -- Number of successful runs for this job. Equal to runs unless this is an invention job
);
CREATE TABLE corporations_medals
(
    corporation_id integer,     -- The corporation ID
    created_at     timestamptz, -- created_at string
    creator_id     integer,     -- ID of the character who created this medal
    description    text,        -- description string
    medal_id       integer,     -- medal_id integer
    title          text         -- title string
);
CREATE TABLE corporations_medals_issued
(
    corporation_id integer,     -- The corporation ID
    character_id   integer,     -- ID of the character who was rewarded this medal
    issued_at      timestamptz, -- issued_at string
    issuer_id      integer,     -- ID of the character who issued the medal
    medal_id       integer,     -- medal_id integer
    reason         text,        -- reason string
    status         text         -- status string
);
CREATE TABLE corporations_members
(
    corporation_id integer, -- Corporation ID
    members        jsonb    -- Members array
);
CREATE TABLE corporations_members_limit
(
    corporation_id integer, -- Corporation ID
    member_limit   integer  -- Member limit
);
CREATE TABLE corporations_members_titles
(
    corporation_id integer, -- The corporation ID
    character_id   integer, -- character_id integer
    titles         jsonb    -- A list of title_id
);
CREATE TABLE corporations_membertracking
(
    corporation_id integer,     -- The corporation ID
    base_id        integer,     -- base_id integer
    character_id   integer,     -- character_id integer
    location_id    bigint,      -- location_id integer
    logoff_date    timestamptz, -- logoff_date string
    logon_date     timestamptz, -- logon_date string
    ship_type_id   integer,     -- ship_type_id integer
    start_date     timestamptz  -- start_date string
);
CREATE TABLE corporations_orders
(
    corporation_id  integer,     -- The corporation ID
    duration        integer,     -- Number of days for which order is valid (starting from the issued date). An order expires at time issued + duration
    escrow          numeric,     -- For buy orders, the amount of ISK in escrow
    is_buy_order    boolean,     -- True if the order is a bid (buy) order
    issued          timestamptz, -- Date and time when this order was issued
    issued_by       integer,     -- The character who issued this order
    location_id     bigint,      -- ID of the location where order was placed
    min_volume      integer,     -- For buy orders, the minimum quantity that will be accepted in a matching sell order
    order_id        bigint,      -- Unique order ID
    price           numeric,     -- Cost per unit for this order
    range           text,        -- Valid order range, numbers are ranges in jumps
    region_id       integer,     -- ID of the region where order was placed
    type_id         integer,     -- The type ID of the item transacted in this order
    volume_remain   integer,     -- Quantity of items still required or offered
    volume_total    integer,     -- Quantity of items required or offered at time order was placed
    wallet_division integer      -- The corporation wallet division used for this order.
);
CREATE TABLE corporations_orders_history
(
    corporation_id  integer,     -- The corporation ID
    duration        integer,     -- Number of days the order was valid for (starting from the issued date). An order expires at time issued + duration
    escrow          numeric,     -- For buy orders, the amount of ISK in escrow
    is_buy_order    boolean,     -- True if the order is a bid (buy) order
    issued          timestamptz, -- Date and time when this order was issued
    issued_by       integer,     -- The character who issued this order
    location_id     bigint,      -- ID of the location where order was placed
    min_volume      integer,     -- For buy orders, the minimum quantity that will be accepted in a matching sell order
    order_id        bigint,      -- Unique order ID
    price           numeric,     -- Cost per unit for this order
    range           text,        -- Valid order range, numbers are ranges in jumps
    region_id       integer,     -- ID of the region where order was placed
    state           text,        -- Current order state
    type_id         integer,     -- The type ID of the item transacted in this order
    volume_remain   integer,     -- Quantity of items still required or offered
    volume_total    integer,     -- Quantity of items required or offered at time order was placed
    wallet_division integer      -- The corporation wallet division used for this order
);
CREATE TABLE corporations_roles
(
    corporation_id           integer, -- The corporation ID
    character_id             integer, -- character_id integer
    grantable_roles          jsonb,   -- grantable_roles array
    grantable_roles_at_base  jsonb,   -- grantable_roles_at_base array
    grantable_roles_at_hq    jsonb,   -- grantable_roles_at_hq array
    grantable_roles_at_other jsonb,   -- grantable_roles_at_other array
    roles                    jsonb,   -- roles array
    roles_at_base            jsonb,   -- roles_at_base array
    roles_at_hq              jsonb,   -- roles_at_hq array
    roles_at_other           jsonb    -- roles_at_other array
);
CREATE TABLE corporations_roles_history
(
    corporation_id integer,     -- The corporation ID
    changed_at     timestamptz, -- changed_at string
    character_id   integer,     -- The character whose roles are changed
    issuer_id      integer,     -- ID of the character who issued this change
    new_roles      jsonb,       -- new_roles array
    old_roles      jsonb,       -- old_roles array
    role_type      text         -- role_type string
);
CREATE TABLE corporations_shareholders
(
    corporation_id   integer, -- The corporation ID
    share_count      bigint,  -- share_count integer
    shareholder_id   integer, -- shareholder_id integer
    shareholder_type text     -- shareholder_type string
);
CREATE TABLE corporations_standings
(
    corporation_id integer, -- The corporation ID
    from_id        integer, -- from_id integer
    from_type      text,    -- from_type string
    standing       float    -- standing number
);
CREATE TABLE corporations_starbases
(
    corporation_id                           integer, -- The corporation ID
    starbase_id                              bigint,  -- An EVE starbase (POS) ID
    allow_alliance_members                   boolean, -- allow_alliance_members boolean
    allow_corporation_members                boolean, -- allow_corporation_members boolean
    anchor                                   text,    -- Who can anchor starbase (POS) and its structures
    attack_if_at_war                         boolean, -- attack_if_at_war boolean
    attack_if_other_security_status_dropping boolean, -- attack_if_other_security_status_dropping boolean
    attack_security_status_threshold         float,   -- Starbase (POS) will attack if target's security standing is lower than this value
    attack_standing_threshold                float,   -- Starbase (POS) will attack if target's standing is lower than this value
    fuel_bay_take                            text,    -- Who can take fuel blocks out of the starbase (POS)'s fuel bay
    fuel_bay_view                            text,    -- Who can view the starbase (POS)'s fule bay. Characters either need to have required role or belong to the starbase (POS) owner's corporation or alliance, as described by the enum, all other access settings follows the same scheme
    fuels                                    jsonb,   -- Fuel blocks and other things that will be consumed when operating a starbase (POS)
    offline                                  text,    -- Who can offline starbase (POS) and its structures
    online                                   text,    -- Who can online starbase (POS) and its structures
    unanchor                                 text,    -- Who can unanchor starbase (POS) and its structures
    use_alliance_standings                   boolean  -- True if the starbase (POS) is using alliance standings, otherwise using corporation's
);
CREATE TABLE corporations_structures
(
    corporation_id       integer,     -- ID of the corporation that owns the structure
    fuel_expires         timestamptz, -- Date on which the structure will run out of fuel
    name                 text,        -- The structure name
    next_reinforce_apply timestamptz, -- The date and time when the structure's newly requested reinforcement times (e.g. next_reinforce_hour and next_reinforce_day) will take effect
    next_reinforce_hour  integer,     -- The requested change to reinforce_hour that will take effect at the time shown by next_reinforce_apply
    profile_id           integer,     -- The id of the ACL profile for this citadel
    reinforce_hour       integer,     -- The hour of day that determines the four hour window when the structure will randomly exit its reinforcement periods and become vulnerable to attack against its armor and/or hull. The structure will become vulnerable at a random time that is +/- 2 hours centered on the value of this property
    services             jsonb,       -- Contains a list of service upgrades, and their state
    state                text,        -- state string
    state_timer_end      timestamptz, -- Date at which the structure will move to it's next state
    state_timer_start    timestamptz, -- Date at which the structure entered it's current state
    structure_id         bigint,      -- The Item ID of the structure
    system_id            integer,     -- The solar system the structure is in
    type_id              integer,     -- The type id of the structure
    unanchors_at         timestamptz  -- Date at which the structure will unanchor
);
CREATE TABLE corporations_titles
(
    corporation_id           integer, -- The corporation ID
    grantable_roles          jsonb,   -- grantable_roles array
    grantable_roles_at_base  jsonb,   -- grantable_roles_at_base array
    grantable_roles_at_hq    jsonb,   -- grantable_roles_at_hq array
    grantable_roles_at_other jsonb,   -- grantable_roles_at_other array
    name                     text,    -- name string
    roles                    jsonb,   -- roles array
    roles_at_base            jsonb,   -- roles_at_base array
    roles_at_hq              jsonb,   -- roles_at_hq array
    roles_at_other           jsonb,   -- roles_at_other array
    title_id                 integer  -- title_id integer
);
CREATE TABLE corporations_wallets
(
    corporation_id integer, -- The corporation ID
    balance        numeric, -- balance number
    division       integer  -- division integer
);
CREATE TABLE corporations_wallets_division_journal
(
    corporation_id  integer,     -- The corporation ID
    division        integer,     -- Wallet key of the division to fetch journals from
    amount          numeric,     -- The amount of ISK given or taken from the wallet as a result of the given transaction. Positive when ISK is deposited into the wallet and negative when ISK is withdrawn
    balance         numeric,     -- Wallet balance after transaction occurred
    context_id      bigint,      -- An ID that gives extra context to the particular transaction. Because of legacy reasons the context is completely different per ref_type and means different things. It is also possible to not have a context_id
    context_id_type text,        -- The type of the given context_id if present
    date            timestamptz, -- Date and time of transaction
    description     text,        -- The reason for the transaction, mirrors what is seen in the client
    first_party_id  integer,     -- The id of the first party involved in the transaction. This attribute has no consistency and is different or non existant for particular ref_types. The description attribute will help make sense of what this attribute means. For more info about the given ID it can be dropped into the /universe/names/ ESI route to determine its type and name
    id              bigint,      -- Unique journal reference ID
    reason          text,        -- The user stated reason for the transaction. Only applies to some ref_types
    ref_type        text,        -- "The transaction type for the given. transaction. Different transaction types will populate different attributes. Note: If you have an existing XML API application that is using ref_types, you will need to know which string ESI ref_type maps to which integer. You can look at the following file to see string->int mappings: https://github.com/ccpgames/eve-glue/blob/master/eve_glue/wallet_journal_ref.py"
    second_party_id integer,     -- The id of the second party involved in the transaction. This attribute has no consistency and is different or non existant for particular ref_types. The description attribute will help make sense of what this attribute means. For more info about the given ID it can be dropped into the /universe/names/ ESI route to determine its type and name
    tax             numeric,     -- Tax amount received. Only applies to tax related transactions
    tax_receiver_id integer      -- The corporation ID receiving any tax paid. Only applies to tax related transactions
);
CREATE TABLE corporations_wallets_division_transactions
(
    corporation_id integer,     -- The corporation ID
    division       integer,     -- Wallet key of the division to fetch journals from
    client_id      integer,     -- client_id integer
    date           timestamptz, -- Date and time of transaction
    is_buy         boolean,     -- is_buy boolean
    journal_ref_id bigint,      -- -1 if there is no corresponding wallet journal entry
    location_id    bigint,      -- location_id integer
    quantity       integer,     -- quantity integer
    transaction_id bigint,      -- Unique transaction ID
    type_id        integer,     -- type_id integer
    unit_price     numeric      -- Amount paid per unit
);
CREATE TABLE dogma_attributes
(
    attribute_id  integer, -- A dogma attribute ID
    default_value float,   -- default_value number
    description   text,    -- description string
    display_name  text,    -- display_name string
    high_is_good  boolean, -- high_is_good boolean
    icon_id       integer, -- icon_id integer
    name          text,    -- name string
    published     boolean, -- published boolean
    stackable     boolean, -- stackable boolean
    unit_id       integer  -- unit_id integer
);
CREATE TABLE dogma_dynamic_items
(
    item_id          bigint,  -- item_id integer
    type_id          integer, -- type_id integer
    created_by       integer, -- The ID of the character who created the item
    dogma_attributes jsonb,   -- dogma_attributes array
    dogma_effects    jsonb,   -- dogma_effects array
    mutator_type_id  integer, -- The type ID of the mutator used to generate the dynamic item.
    source_type_id   integer  -- The type ID of the source item the mutator was applied to create the dynamic item.
);
CREATE TABLE dogma_effects
(
    effect_id                   integer, -- A dogma effect ID
    description                 text,    -- description string
    disallow_auto_repeat        boolean, -- disallow_auto_repeat boolean
    discharge_attribute_id      integer, -- discharge_attribute_id integer
    display_name                text,    -- display_name string
    duration_attribute_id       integer, -- duration_attribute_id integer
    effect_category             integer, -- effect_category integer
    electronic_chance           boolean, -- electronic_chance boolean
    falloff_attribute_id        integer, -- falloff_attribute_id integer
    icon_id                     integer, -- icon_id integer
    is_assistance               boolean, -- is_assistance boolean
    is_offensive                boolean, -- is_offensive boolean
    is_warp_safe                boolean, -- is_warp_safe boolean
    modifiers                   jsonb,   -- modifiers array
    name                        text,    -- name string
    post_expression             integer, -- post_expression integer
    pre_expression              integer, -- pre_expression integer
    published                   boolean, -- published boolean
    range_attribute_id          integer, -- range_attribute_id integer
    range_chance                boolean, -- range_chance boolean
    tracking_speed_attribute_id integer  -- tracking_speed_attribute_id integer
);
CREATE TABLE fw_leaderboards
(
    kills          jsonb, -- Top 4 rankings of factions by number of kills from yesterday, last week and in total
    victory_points jsonb  -- Top 4 rankings of factions by victory points from yesterday, last week and in total
);
CREATE TABLE fw_leaderboards_characters
(
    kills          jsonb, -- Top 100 rankings of pilots by number of kills from yesterday, last week and in total
    victory_points jsonb  -- Top 100 rankings of pilots by victory points from yesterday, last week and in total
);
CREATE TABLE fw_leaderboards_corporations
(
    kills          jsonb, -- Top 10 rankings of corporations by number of kills from yesterday, last week and in total
    victory_points jsonb  -- Top 10 rankings of corporations by victory points from yesterday, last week and in total
);
CREATE TABLE fw_stats
(
    faction_id         integer, -- faction_id integer
    kills              jsonb,   -- Summary of kills against an enemy faction for the given faction
    pilots             integer, -- How many pilots fight for the given faction
    systems_controlled integer, -- The number of solar systems controlled by the given faction
    victory_points     jsonb    -- Summary of victory points gained for the given faction
);
CREATE TABLE fw_systems
(
    contested                text,    -- contested string
    occupier_faction_id      integer, -- occupier_faction_id integer
    owner_faction_id         integer, -- owner_faction_id integer
    solar_system_id          integer, -- solar_system_id integer
    victory_points           integer, -- victory_points integer
    victory_points_threshold integer  -- victory_points_threshold integer
);
CREATE TABLE fw_wars
(
    against_id integer, -- The faction ID of the enemy faction.
    faction_id integer  -- faction_id integer
);
CREATE TABLE incursions
(
    constellation_id        integer, -- The constellation id in which this incursion takes place
    faction_id              integer, -- The attacking faction's id
    has_boss                boolean, -- Whether the final encounter has boss or not
    infested_solar_systems  jsonb,   -- A list of infested solar system ids that are a part of this incursion
    influence               float,   -- Influence of this incursion as a float from 0 to 1
    staging_solar_system_id integer, -- Staging solar system for this incursion
    state                   text,    -- The state of this incursion
    type                    text     -- The type of this incursion
);
CREATE TABLE industry_facilities
(
    facility_id     bigint,  -- ID of the facility
    owner_id        integer, -- Owner of the facility
    region_id       integer, -- Region ID where the facility is
    solar_system_id integer, -- Solar system ID where the facility is
    tax             float,   -- Tax imposed by the facility
    type_id         integer  -- Type ID of the facility
);
CREATE TABLE industry_systems
(
    cost_indices    jsonb,  -- cost_indices array
    solar_system_id integer -- solar_system_id integer
);
CREATE TABLE killmails
(
    killmail_hash   text,        -- The killmail hash for verification
    killmail_id     integer,     -- The killmail ID to be queried
    attackers       jsonb,       -- attackers array
    killmail_time   timestamptz, -- Time that the victim was killed and the killmail generated
    moon_id         integer,     -- Moon if the kill took place at one
    solar_system_id integer,     -- Solar system that the kill took place in
    victim          jsonb,       -- victim object
    war_id          integer      -- War if the killmail is generated in relation to an official war

);
CREATE TABLE loyalty_stores_offers
(
    ak_cost        integer, -- Analysis kredit cost
    isk_cost       bigint,  -- isk_cost integer
    lp_cost        integer, -- lp_cost integer
    offer_id       integer, -- offer_id integer
    quantity       integer, -- quantity integer
    required_items jsonb,   -- required_items array
    type_id        integer  -- type_id integer
);
CREATE TABLE markets_groups_market
(
    market_group_id integer, -- An Eve item group ID
    description     text,    -- description string
    name            text,    -- name string
    parent_group_id integer, -- parent_group_id integer
    types           jsonb    -- types array
);
CREATE TABLE markets_prices
(
    adjusted_price numeric, -- adjusted_price number
    average_price  numeric, -- average_price number
    type_id        integer  -- type_id integer
);
CREATE TABLE markets_structures
(
    structure_id  bigint,      -- Return orders in this structure
    duration      integer,     -- duration integer
    is_buy_order  boolean,     -- is_buy_order boolean
    issued        timestamptz, -- issued string
    location_id   bigint,      -- location_id integer
    min_volume    integer,     -- min_volume integer
    order_id      bigint,      -- order_id integer
    price         numeric,     -- price number
    range         text,        -- range string
    type_id       integer,     -- type_id integer
    volume_remain integer,     -- volume_remain integer
    volume_total  integer      -- volume_total integer
);
CREATE TABLE markets_history
(
    type_id     integer,     -- The Type ID that this entry refers to
    region_id   integer,     -- Return statistics in this region
    average     numeric,     -- average number
    date        timestamptz, -- The date of this historical statistic entry
    highest     numeric,     -- highest number
    lowest      numeric,     -- lowest number
    order_count bigint,      -- Total number of orders happened that day
    volume      bigint       -- Total
);
CREATE TABLE markets_orders
(
    region_id     integer,     -- Return orders in this region
    duration      integer,     -- duration integer
    is_buy_order  boolean,     -- is_buy_order boolean
    issued        timestamptz, -- issued string
    location_id   bigint,      -- location_id integer
    min_volume    integer,     -- min_volume integer
    order_id      bigint,      -- order_id integer
    price         numeric,     -- price number
    range         text,        -- range string
    system_id     integer,     -- The solar system this order was placed
    type_id       integer,     -- type_id integer
    volume_remain integer,     -- volume_remain integer
    volume_total  integer      -- volume_total integer
);
CREATE TABLE opportunities_groups
(
    group_id         integer, -- ID of an opportunities group
    connected_groups jsonb,   -- The groups that are connected to this group on the opportunities map
    description      text,    -- description string
    name             text,    -- name string
    notification     text,    -- notification string
    required_tasks   jsonb    -- Tasks need to complete for this group
);
CREATE TABLE opportunities_tasks
(
    task_id      integer, -- ID of an opportunities task
    description  text,    -- description string
    name         text,    -- name string
    notification text     -- notification string
);
CREATE TABLE sovereignty_campaigns
(
    attackers_score  float,       -- Score for all attacking parties, only present in Defense Events.
    campaign_id      integer,     -- Unique ID for this campaign.
    constellation_id integer,     -- The constellation in which the campaign will take place.
    defender_id      integer,     -- Defending alliance, only present in Defense Events
    defender_score   float,       -- Score for the defending alliance, only present in Defense Events.
    event_type       text,        -- Type of event this campaign is for. tcu_defense, ihub_defense and station_defense are referred to as "Defense Events", station_freeport as "Freeport Events".
    participants     jsonb,       -- Alliance participating and their respective scores, only present in Freeport Events.
    solar_system_id  integer,     -- The solar system the structure is located in.
    start_time       timestamptz, -- Time the event is scheduled to start.
    structure_id     bigint       -- The structure item ID that is related to this campaign.
);
CREATE TABLE sovereignty_map
(
    alliance_id    integer, -- alliance_id integer
    corporation_id integer, -- corporation_id integer
    faction_id     integer, -- faction_id integer
    system_id      integer  -- system_id integer
);
CREATE TABLE sovereignty_structures
(
    alliance_id                   integer,     -- The alliance that owns the structure.
    solar_system_id               integer,     -- Solar system in which the structure is located.
    structure_id                  bigint,      -- Unique item ID for this structure.
    structure_type_id             integer,     -- A reference to the type of structure this is.
    vulnerability_occupancy_level float,       -- The occupancy level for the next or current vulnerability window. This takes into account all development indexes and capital system bonuses. Also known as Activity Defense Multiplier from in the client. It increases the time that attackers must spend using their entosis links on the structure.
    vulnerable_end_time           timestamptz, -- The time at which the next or current vulnerability window ends. At the end of a vulnerability window the next window is recalculated and locked in along with the vulnerabilityOccupancyLevel. If the structure is not in 100% entosis control of the defender, it will go in to 'overtime' and stay vulnerable for as long as that situation persists. Only once the defenders have 100% entosis control and has the vulnerableEndTime passed does the vulnerability interval expire and a new one is calculated.
    vulnerable_start_time         timestamptz  -- The next time at which the structure will become vulnerable. Or the start time of the current window if current time is between this and vulnerableEndTime.
);
CREATE TABLE status
(
    players        integer,     -- Current online player count
    server_version text,        -- Running version as string
    start_time     timestamptz, -- Server start timestamp
    vip            boolean      -- If the server is in VIP mode
);
CREATE TABLE universe_ancestries
(
    bloodline_id      integer, -- The bloodline associated with this ancestry
    description       text,    -- description string
    icon_id           integer, -- icon_id integer
    id                integer, -- id integer
    name              text,    -- name string
    short_description text     -- short_description string
);
CREATE TABLE universe_asteroid_belts
(
    asteroid_belt_id integer, -- asteroid_belt_id integer
    name             text,    -- name string
    position         jsonb,   -- position object
    system_id        integer  -- The solar system this asteroid belt is in
);
CREATE TABLE universe_bloodlines
(
    bloodline_id   integer, -- bloodline_id integer
    charisma       integer, -- charisma integer
    corporation_id integer, -- corporation_id integer
    description    text,    -- description string
    intelligence   integer, -- intelligence integer
    memory         integer, -- memory integer
    name           text,    -- name string
    perception     integer, -- perception integer
    race_id        integer, -- race_id integer
    ship_type_id   integer, -- ship_type_id integer
    willpower      integer  -- willpower integer
);
CREATE TABLE universe_categories
(
    category_id integer, -- An Eve item category ID
    groups      jsonb,   -- groups array
    name        text,    -- name string
    published   boolean  -- published boolean
);
CREATE TABLE universe_constellations
(
    constellation_id integer, -- constellation_id integer
    name             text,    -- name string
    position         jsonb,   -- position object
    region_id        integer, -- The region this constellation is in
    systems          jsonb    -- systems array
);
CREATE TABLE universe_factions
(
    corporation_id         integer, -- corporation_id integer
    description            text,    -- description string
    faction_id             integer, -- faction_id integer
    is_unique              boolean, -- is_unique boolean
    militia_corporation_id integer, -- militia_corporation_id integer
    name                   text,    -- name string
    size_factor            float,   -- size_factor number
    solar_system_id        integer, -- solar_system_id integer
    station_count          integer, -- station_count integer
    station_system_count   integer  -- station_system_count integer
);
CREATE TABLE universe_graphics
(
    graphic_id      integer, -- graphic_id integer
    collision_file  text,    -- collision_file string
    graphic_file    text,    -- graphic_file string
    icon_folder     text,    -- icon_folder string
    sof_dna         text,    -- sof_dna string
    sof_fation_name text,    -- sof_fation_name string
    sof_hull_name   text,    -- sof_hull_name string
    sof_race_name   text     -- sof_race_name string
);
CREATE TABLE universe_groups
(
    group_id    integer, -- An Eve item group ID
    category_id integer, -- category_id integer
    name        text,    -- name string
    published   boolean, -- published boolean
    types       jsonb    -- types array
);
CREATE TABLE universe_moons
(
    moon_id   integer, -- moon_id integer
    name      text,    -- name string
    position  jsonb,   -- position object
    system_id integer  -- The solar system this moon is in
);
CREATE TABLE universe_planets
(
    planet_id integer, -- planet_id integer
    name      text,    -- name string
    position  jsonb,   -- position object
    system_id integer, -- The solar system this planet is in
    type_id   integer  -- type_id integer
);
CREATE TABLE universe_races
(
    alliance_id integer, -- The alliance generally associated with this race
    description text,    -- description string
    name        text,    -- name string
    race_id     integer  -- race_id integer
);
CREATE TABLE universe_regions
(
    region_id      integer, -- region_id integer
    constellations jsonb,   -- constellations array
    description    text,    -- description string
    name           text     -- name string
);
CREATE TABLE universe_schematics
(
    schematic_id   integer, -- A PI schematic ID
    cycle_time     integer, -- Time in seconds to process a run
    schematic_name text     -- schematic_name string
);
CREATE TABLE universe_stargates
(
    stargate_id integer, -- stargate_id integer
    destination jsonb,   -- destination object
    name        text,    -- name string
    position    jsonb,   -- position object
    system_id   integer, -- The solar system this stargate is in
    type_id     integer  -- type_id integer
);
CREATE TABLE universe_stars
(
    star_id         integer, -- star_id integer
    age             bigint,  -- Age of star in years
    luminosity      float,   -- luminosity number
    name            text,    -- name string
    radius          bigint,  -- radius integer
    solar_system_id integer, -- solar_system_id integer
    spectral_class  text,    -- spectral_class string
    temperature     integer, -- temperature integer
    type_id         integer  -- type_id integer
);
CREATE TABLE universe_stations
(
    station_id                 integer, -- station_id integer
    max_dockable_ship_volume   float,   -- max_dockable_ship_volume number
    name                       text,    -- name string
    office_rental_cost         float,   -- office_rental_cost number
    owner                      integer, -- ID of the corporation that controls this station
    position                   jsonb,   -- position object
    race_id                    integer, -- race_id integer
    reprocessing_efficiency    float,   -- reprocessing_efficiency number
    reprocessing_stations_take float,   -- reprocessing_stations_take number
    services                   jsonb,   -- services array
    system_id                  integer, -- The solar system this station is in
    type_id                    integer  -- type_id integer
);
CREATE TABLE universe_structures
(
    structure_id    bigint,  -- An Eve structure ID
    name            text,    -- The full name of the structure
    owner_id        integer, -- The ID of the corporation who owns this particular structure
    position        jsonb,   -- Coordinates of the structure in Cartesian space relative to the Sun, in metres.
    solar_system_id integer, -- solar_system_id integer
    type_id         integer  -- type_id integer
);
CREATE TABLE universe_system_jumps
(
    ship_jumps integer, -- ship_jumps integer
    system_id  integer  -- system_id integer
);
CREATE TABLE universe_system_kills
(
    npc_kills  integer, -- Number of NPC ships killed in this system
    pod_kills  integer, -- Number of pods killed in this system
    ship_kills integer, -- Number of player ships killed in this system
    system_id  integer  -- system_id integer
);
CREATE TABLE universe_systems
(
    system_id        integer, -- system_id integer
    constellation_id integer, -- The constellation this solar system is in
    name             text,    -- name string
    planets          jsonb,   -- planets array
    position         jsonb,   -- position object
    security_class   text,    -- security_class string
    security_status  float,   -- security_status number
    star_id          integer, -- star_id integer
    stargates        jsonb,   -- stargates array
    stations         jsonb    -- stations array
);
CREATE TABLE universe_types
(
    type_id          integer, -- An Eve item type ID
    capacity         float,   -- capacity number
    description      text,    -- description string
    dogma_attributes jsonb,   -- dogma_attributes array
    dogma_effects    jsonb,   -- dogma_effects array
    graphic_id       integer, -- graphic_id integer
    group_id         integer, -- group_id integer
    icon_id          integer, -- icon_id integer
    market_group_id  integer, -- This only exists for types that can be put on the market
    mass             float,   -- mass number
    name             text,    -- name string
    packaged_volume  float,   -- packaged_volume number
    portion_size     integer, -- portion_size integer
    published        boolean, -- published boolean
    radius           float,   -- radius number
    volume           float    -- volume number
);
CREATE TABLE wars
(
    aggressor       jsonb,       -- The aggressor corporation or alliance that declared this war, only contains either corporation_id or alliance_id
    allies          jsonb,       -- allied corporations or alliances, each object contains either corporation_id or alliance_id
    declared        timestamptz, -- Time that the war was declared
    defender        jsonb,       -- The defending corporation or alliance that declared this war, only contains either corporation_id or alliance_id
    finished        timestamptz, -- Time the war ended and shooting was no longer allowed
    id              integer,     -- ID of the specified war
    mutual          boolean,     -- Was the war declared mutual by both parties
    open_for_allies boolean,     -- Is the war currently open for allies or not
    retracted       timestamptz, -- Time the war was retracted but both sides could still shoot each other
    started         timestamptz  -- Time when the war started and both sides could shoot each other
);
