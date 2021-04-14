/*
 * generated by Xtext 2.20.0
 */
package uk.ac.kcl.mde.awk.validation

import org.eclipse.xtext.validation.Check
import uk.ac.kcl.mde.awk.awk.AwkPackage
import uk.ac.kcl.mde.awk.awk.AwkProgram
import uk.ac.kcl.mde.awk.awk.SectionHeader
import uk.ac.kcl.mde.awk.awk.Section
import uk.ac.kcl.mde.awk.awk.MatchStatement
import uk.ac.kcl.mde.awk.awk.impl.MatchStatementImpl
import java.util.List
import uk.ac.kcl.mde.awk.awk.Statement

/** 
 * This class contains custom validation rules. 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class AwkValidator extends AbstractAwkValidator { 

	public static val INVALID_SECTION = 'invalid_section'
	public static val INVALID_MATCH_PRINT_STATEMENT = 'invalid_match_print_statement'
	
	 @Check
	 def checkSectionHeaderNotDuplicate(AwkProgram program) {
		if (program.sections.filter[x | x.section == SectionHeader.START].size > 1) {
			error('There must not be two start headers', program,
				program.eContainingFeature, INVALID_SECTION)
			
		}
		if (program.sections.filter[x | x.section == SectionHeader.BODY].size > 1) {
			error('There must not be two body headers', program,
				program.eContainingFeature, INVALID_SECTION)
		}
		
		if (program.sections.filter[x | x.section == SectionHeader.END].size > 1) {
			error('There must not be two end headers', program,
				program.eContainingFeature, INVALID_SECTION)
		}
	}
	
	@Check
	 def checkPrintAfterMatchStatement(Section section) {
	 	for(i : 0 ..< (section.statements.size)){
	 		if (section.statements.get(i).eClass.name == "MatchStatement") {
	 			if(i == section.statements.size - 1){
					warning('There should be a print statement after a match statement', section,
						section.eContainer.eContainingFeature, INVALID_MATCH_PRINT_STATEMENT)
	 			}
	 			else{
		 			if (section.statements.get(i + 1).eClass.name !== "PrintStatement") {
						warning('There should be a print statement after a match statement', section,
							section.eContainer.eContainingFeature, INVALID_MATCH_PRINT_STATEMENT)
					}
				}
 			}
 		}
	}
}