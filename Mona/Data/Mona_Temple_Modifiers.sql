-- A "weird" tweak to make a Lua controlled modifier, Inspired by C1sen and Shimamura et al.
INSERT INTO BuildingModifiers (BuildingType, ModifierId)
VALUES  ('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_1'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_1'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_2'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_2'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_4'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_4'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_8'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_8'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_16'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_16'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_32'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_32'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_64'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_64'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_128'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_128'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_256'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_256'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_512'),
		('BUILDING_TEMPLE_OF_THE_STAR_LATITUDES',	'MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_512');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES  ('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_1',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_1'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_1', 		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_1'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_2',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_2'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_2', 		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_2'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_4',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_4'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_4', 		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_4'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_8',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_8'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_8', 		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_8'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_16',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_16'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_16', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_16'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_32',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_32'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_32', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_32'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_64',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_64'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_64', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_64'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_128',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_128'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_128', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_128'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_256',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_256'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_256', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_256'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_512',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_512'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_512', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	'REQUIREMENTS_MONA_TSL_512');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES	('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_1',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_1',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_1',		'Amount',	1),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_1',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_1',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_1',		'Amount',	1),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_2',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_2',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_2',		'Amount',	2),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_2',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_2',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_2',		'Amount',	2),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_4',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_4',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_4',		'Amount',	4),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_4',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_4',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_4',		'Amount',	4),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_8',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_8',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_8',		'Amount',	8),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_8',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_8',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_8',		'Amount',	8),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_16',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_16',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_16',		'Amount',	16),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_16',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_16',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_16',		'Amount',	16),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_32',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_32',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_32',		'Amount',	32),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_32',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_32',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_32',		'Amount',	32),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_64',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_64',		'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_64',		'Amount',	64),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_64',		'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_64',		'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_64',		'Amount',	64),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_128',	'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_128',	'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_128',	'Amount',	128),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_128',	'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_128',	'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_128',	'Amount',	128),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_256',	'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_256',	'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_256',	'Amount',	256),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_256',	'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_256',	'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_256',	'Amount',	256),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_512',	'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_512',	'YieldType',	'YIELD_SCIENCE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_SCIENCE_512',	'Amount',	512),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_512',	'BuildingType',	'BUILDING_TEMPLE_OF_THE_STAR_LATITUDES'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_512',	'YieldType',	'YIELD_CULTURE'),
		('MOD_TEMPLE_OF_THE_STAR_LATITUDES_CULTURE_512',	'Amount',	512);

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES	('REQUIREMENTS_MONA_TSL_1',		'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_2',		'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_4',		'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_8',		'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_16',	'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_32',	'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_64',	'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_128',	'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_256',	'REQUIREMENTSET_TEST_ALL'),
		('REQUIREMENTS_MONA_TSL_512',	'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES	('REQUIREMENTS_MONA_TSL_1',		'MONA_TSL_1'),
		('REQUIREMENTS_MONA_TSL_2',		'MONA_TSL_2'),
		('REQUIREMENTS_MONA_TSL_4',		'MONA_TSL_4'),
		('REQUIREMENTS_MONA_TSL_8',		'MONA_TSL_8'),
		('REQUIREMENTS_MONA_TSL_16',	'MONA_TSL_16'),
		('REQUIREMENTS_MONA_TSL_32',	'MONA_TSL_32'),
		('REQUIREMENTS_MONA_TSL_64',	'MONA_TSL_64'),
		('REQUIREMENTS_MONA_TSL_128',	'MONA_TSL_128'),
		('REQUIREMENTS_MONA_TSL_256',	'MONA_TSL_256'),
		('REQUIREMENTS_MONA_TSL_512',	'MONA_TSL_512');

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES	('MONA_TSL_1',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_2',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_4',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_8',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_16',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_32',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_64',		'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_128',	'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_256',	'REQUIREMENT_PLOT_PROPERTY_MATCHES'),
		('MONA_TSL_512',	'REQUIREMENT_PLOT_PROPERTY_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES	('MONA_TSL_1',		'PropertyName',		'1.MonaTSL'),
		('MONA_TSL_1',		'PropertyMinimum',	'1'),
		('MONA_TSL_2',		'PropertyName',		'2.MonaTSL'),
		('MONA_TSL_2',		'PropertyMinimum',	'1'),
		('MONA_TSL_4',		'PropertyName',		'4.MonaTSL'),
		('MONA_TSL_4',		'PropertyMinimum',	'1'),
		('MONA_TSL_8',		'PropertyName',		'8.MonaTSL'),
		('MONA_TSL_8',		'PropertyMinimum',	'1'),
		('MONA_TSL_16',		'PropertyName',		'16.MonaTSL'),
		('MONA_TSL_16',		'PropertyMinimum',	'1'),
		('MONA_TSL_32',		'PropertyName',		'32.MonaTSL'),
		('MONA_TSL_32',		'PropertyMinimum',	'1'),
		('MONA_TSL_64',		'PropertyName',		'64.MonaTSL'),
		('MONA_TSL_64',		'PropertyMinimum',	'1'),
		('MONA_TSL_128',	'PropertyName',		'128.MonaTSL'),
		('MONA_TSL_128',	'PropertyMinimum',	'1'),
		('MONA_TSL_256',	'PropertyName',		'256.MonaTSL'),
		('MONA_TSL_256',	'PropertyMinimum',	'1'),
		('MONA_TSL_512',	'PropertyName',		'512.MonaTSL'),
		('MONA_TSL_512',	'PropertyMinimum',	'1');