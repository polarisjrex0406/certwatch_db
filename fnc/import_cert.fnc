/* certwatch_db - Database schema
 * Written by Rob Stradling
 * Copyright (C) 2015-2023 Sectigo Limited
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

CREATE OR REPLACE FUNCTION import_cert(
	_cert_data				IN		bytea
) RETURNS certificate.ID%TYPE
AS $$
DECLARE
	t_certificateID		certificate.ID%TYPE;
BEGIN
	SELECT iac._certificate_id
		INTO t_certificateID
		FROM import_any_cert(_cert_data, NULL) iac;

	RETURN t_certificateID;
END;
$$ LANGUAGE plpgsql;
