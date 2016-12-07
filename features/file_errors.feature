Feature: Submit files for initial checking
  As a user I want to be informed if there are any
  significant problems with the format or structure
  of the file before the contents are validated
  for correctness

  Scenario: Check for file errors (unreadable/malicious CSV content)
    Given I have the following files and expectations
      | Filename                                 | ErrorCode | Status     |
      | DR0400_not_csv.png                       | DR0400    | FILE ERROR |
      | DR0500_Empty.csv                         | DR0500    | FILE ERROR |
      | DR0600_Unsafe.csv                        | DR0600    | FILE ERROR |
      | DR0550_Large_file.csv                    | DR0550    | FILE ERROR |
      | DR0450_CSV_Structure.csv                 | DR0450    | FILE ERROR |
      | DR0820_Missing_Site_Name_Header_only.csv | DR0820    | FILE ERROR |
      | DR0820_Missing_EA_ID_Header.csv          | DR0820    | FILE ERROR |
      | DR0820_Missing_Rtn_Type_Header.csv       | DR0820    | FILE ERROR |
      | DR0820_Missing_Mon_Point_Header.csv      | DR0820    | FILE ERROR |
      | DR0820_Missing_Mon_Date_Header.csv       | DR0820    | FILE ERROR |
      | DR0820_Missing_Parameter_Header.csv      | DR0820    | FILE ERROR |
      | DR0840_Unrecognised_header.csv           | DR0840    | FILE ERROR |
      | DR0860_Duplicate_Site_Name_Header.csv    | DR0860    | FILE ERROR |
      | DR0860_Duplicate_Sample_by_Header.csv    | DR0860    | FILE ERROR |
    When I upload those files
    Then I am unable to continue
    And I expect each file's status to meet expectations
    And Invalid file page shows the appropriate information