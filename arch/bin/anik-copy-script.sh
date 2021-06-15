#!/usr/bin/env zsh

from_db=yaguara
from_host=yaguara-web-production.cv360oyfmcuy.us-east-2.rds.amazonaws.com
from_user=i8jEDBevToM
to_db=yaguara
to_host=cohort-analysis.cv360oyfmcuy.us-east-2.rds.amazonaws.com
to_user=RhIOZePwTqYIr

sync() {
    psql -U $from_user -h $from_host -d $from_db -c "\copy (select * from $1 where integration_id = $2) TO '/tmp/$1.csv' csv"

    psql -U $to_user -h $to_host -d $to_db -c "delete from $1 where integration_id = $2;"

    psql -U $to_user -h $to_host -d $to_db -c "\copy $1 FROM '/tmp/$1.csv' csv"
}

sync_shopify() {
    # sync shopify_checkout $1
    # sync shopify_fulfillment $1
    # sync shopify_order_line_item $1
    # sync shopify_product_variant $1
    # sync shopify_customer $1
    sync shopify_order $1
    # sync shopify_price_rule $1
    sync shopify_refund $1
    # sync shopify_discount_code $1
    # sync shopify_order_discount_code $1
    # sync shopify_product $1
    # sync shopify_refund_line_item $1
    echo "Synced shopify for $1"
}

sync_gorgias() {
    sync gorgias_message $1
    sync gorgias_survey $1
    sync gorgias_ticket $1
    echo "Synced gorgias for $1"
}

# Blume
# sync_shopify 1437
# sync_gorgias 1453

# Sand Cloud
# sync_shopify 1271
# sync_shopify 1189
# sync_gorgias 1368

# Skylar
# sync_shopify 1522

# Ugly Drinks
# sync_shopify 1568
# sync_shopify 1567
# sync_gorgias 1574

# Paravel
# sync_shopify 1168

# Nuggs
# sync_shopify 1673

# Coterie
# sync_shopify 1990

# Senreve
# sync_shopify 1722

# Outer
# sync_shopify 1736

# Momentous
# sync_shopify 2035

# meshki-clothing
# sync_shopify 1777

# meshki-us
# sync_shopify 1924

# MaryRuth Organics
# sync_shopify 1940

# Frey
sync_shopify 2281

# Super73
sync_shopify 2105
