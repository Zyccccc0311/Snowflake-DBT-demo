{{ config(materialized='table') }}

select
    C_NAME as customer_name,
    C_ADDRESS as customer_address,
    C_PHONE as customer_phone,
    C_ACCTBAL as acctbal, 
    C_MKTSEGMENT as market_segment, 
    tsn.n_name as nation,
    tsr.r_name as region
from {{ ref('stg_customer') }} tsc
left join {{ ref('stg_nation') }} tsn
    on tsc.c_nationkey = tsn.n_nationkey
left join {{ ref('stg_region') }} tsr
    on tsn.n_regionkey = tsr.r_regionkey