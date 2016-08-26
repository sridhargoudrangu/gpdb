-- @Description Tests the visibility of an "with hold" cursor w.r.t. deletes.
-- 

1: DECLARE cur CURSOR WITH HOLD FOR SELECT a FROM ao ORDER BY a;
1: FETCH NEXT IN cur;
1: FETCH NEXT IN cur;
2: BEGIN;
2: DELETE FROM ao WHERE a < 5;
2: COMMIT;
1: FETCH NEXT IN cur;
1: FETCH NEXT IN cur;
1: FETCH NEXT IN cur;
1: CLOSE cur;
3: DECLARE cur CURSOR WITH HOLD FOR SELECT a FROM ao ORDER BY a;
3: FETCH NEXT IN cur;
3: CLOSE cur;