
-- VIEW -- No. of skeins needed to complete each project

CREATE VIEW YarnSkeinsNeeded AS
SELECT py.project_id, p.project_name,
    CEIL((py.total_meterage_needed - py.meterage_used) / y.meterage_per_skein) AS total_skeins_needed
FROM ProjectYarns py
JOIN Projects p ON py.project_id = p.project_id
JOIN Yarnstock y ON py.yarn_id = y.yarn_id;

-- GROUP BY -- Total meterage owned

SELECT Yarn_id, brand, name, SUM(meterage_per_skein * skeins_owned) AS TOTAL_METERAGE_OWNED
FROM YarnStock
GROUP BY Yarn_id
ORDER BY brand ASC;

-- STORED FUNCTION - HOW LONG A PROJECT TOOK TO COMPLETE--

DELIMITER //

CREATE FUNCTION CalculateProjectDuration(projectId VARCHAR(10))
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE projectDuration INT;

    SELECT DATEDIFF(NOW(), start_date) INTO projectDuration
    FROM Projects
    WHERE project_id = projectId;

    RETURN projectDuration;
END //

DELIMITER ;

SELECT CalculateProjectDuration('P1') AS project_duration;  -- ALTER FOR EACH COMPLETED PROJECT ID --

-- SUBQUERY --- -- Type of project 'JUMPERS' that are 'Complete', and no. of days taken to complete ---

SELECT project_id, project_name, SUM(DATEDIFF(completion_date, start_date)) AS Total_Days_to_Complete
FROM Projects
WHERE pattern_id IN (
        SELECT
            pattern_id
        FROM
            Patterns
        WHERE
            pattern_category = 'Jumper')
GROUP BY
project_id, project_name;


-- EVENT -- SCHEDULED TO UPDATE PROJECT STATUS --

SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE EVENT RecurringUpdateProjectStatus
ON SCHEDULE
    EVERY 20 SECOND
DO
BEGIN
    UPDATE Projects
    SET status = 'Completed'
    WHERE completion_date IS NOT NULL AND completion_date <= CURDATE();
    UPDATE Projects
    SET status = 'In-Progress'
    WHERE completion_date IS NULL;
END //
DELIMITER 

UPDATE Projects
SET completion_date = null
WHERE project_id = "P5";

select * from projects;
