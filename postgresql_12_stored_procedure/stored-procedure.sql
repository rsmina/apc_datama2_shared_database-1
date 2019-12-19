DROP PROCEDURE IF EXISTS MI182_rrlee.update_warehoues_type;

CREATE OR REPLACE PROCEDURE
    MI182_rrlee.update_warehouse_type(integer, varchar)
LANGUAGE
    plpgsql
AS $procedure$
BEGIN

    -- add warehouse type if not exists
    INSERT INTO
        MI182_rrlee.warehouse_types (type)
    SELECT
        $2
    WHERE NOT EXISTS (
        SELECT type FROM MI182_rrlee.warehouse_types WHERE type = $2
    );

    -- updates the type of warehouse through finding the id of the corresponding string parameter
    UPDATE MI182_rrlee.warehouses
    SET
        warehouse_type_id = (SELECT
            MI182_rrlee.warehouse_types.id FROM MI182_rrlee.warehouse_types WHERE type = $2)
    WHERE id = $1;

    COMMIT;
END;
$procedure$
;
