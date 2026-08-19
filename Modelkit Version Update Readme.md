# Updating Modelkit to work with newer versions of EnergyPlus

This forked repository permits testing of processes developed by me to update EnergyPlus objects contained within the templates. The folder structure is intended to coexist with the existing, unadulterated models in the source repository; this ensures that existing measures can continue to be analyzed and run as if the refactored or upversioned models did not exist. Also, this effort only addresses non-residential models, as residential models were developed using a different path. Key folders for testing and examining file changes that support this process include:

\Prototypes - this is the existing folder, unchanged, from the source repository.
\Prototypes_v2 - this contains two subfolders:
	\v2220 - contains the same prototypes as the original Prototypes folder, except that certain modifications are made in support of
	the template update process; the main changes include removal of semi-colons from schedule parameters.
	\v2520 - contains the same prototype root files as the v2220 folder; however, the geometry.pxt files for each prototype
	are updated to EnergyPlus v25.20. 
\Templates\energyplus\templates - this is the existing folder, unchanged, from the source repository.
\Templates\energyplus\v2220 - this folder contains all refactored templates, as needed to support programmatic updates using IDFUpdater. It also contains the "masked" copies of all nonresidential templates, which mirror the templates but contain a character mask to direct IDFUpdater to ignore ruby code and certain EnergyPlus objects that are shown to fail the update process.
\Templates\energyplus\v2520 - this folder contains template files that have been updated to EnergyPlus v25.20. It also contains the upversioned, masked copies of all templates (retained in idf format).
\commercial measures - same folder as source repository, is used for baselining template performance during development and testing of this update process
\commercial v2220 - mirrors the commercial measures folder, but the .modelkit-config file for each measure is modified to redirect the measure to the updated prototypes and templates folders:

prototypes-dir = '../../prototypes_v2/v2220'
templates-dir = '../../templates/energyplus/version2220'

Similar changes will be made when testing for the v25.20 files are conducted. In addition, at that time, the EnergyPlus file version in this file will need to be updated to version 25.20. The existing file contains both paths, with the v25.20 path commented out:

#engine = 'C:\EnergyPlusV25-2-0'  # Must be an absolute path
engine = 'C:\EnergyPlusV22-2-0'  # Must be an absolute path

The same approach can be made with any version of EnergyPlus, meaning the developer can use the update process to upversion the Modelkit files to any published EnergyPlus version, as long as the steps are followed properly and the correct EnergyPlus version is added to the .modelkit-config file for each measure being analyzed.