package uk.ac.kcl.mde.awk.scoping

import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.xtext.scoping.IScope
import org.eclipse.xtext.scoping.Scopes
import org.eclipse.xtext.scoping.impl.AbstractDeclarativeScopeProvider
import uk.ac.kcl.mde.awk.awk.AwkPackage
import uk.ac.kcl.mde.awk.awk.VarReference
import uk.ac.kcl.mde.awk.awk.Section
import uk.ac.kcl.mde.awk.awk.AwkProgram
import uk.ac.kcl.mde.awk.awk.SectionHeader
import uk.ac.kcl.mde.awk.awk.Statement

class AwkScopeProvider extends AbstractDeclarativeScopeProvider {
	override IScope getScope(EObject context, EReference reference) {
		if (context instanceof VarReference && reference == AwkPackage.Literals.VAR_REFERENCE__VAL) {
			var Section sectionBlock = context.eContainer.eContainer as Section
			if (sectionBlock.section.equals(SectionHeader.START)){
				return Scopes.scopeFor(sectionBlock.statements)
			}
			else if (sectionBlock.section.equals(SectionHeader.BODY)){
				var AwkProgram awkProgram = sectionBlock.eContainer as AwkProgram
				var startSectionBlock = awkProgram.sections.filter[x | x.section == SectionHeader.START].head as Section
				var bodySectionBlock = awkProgram.sections.filter[x | x.section == SectionHeader.BODY].head as Section
				return Scopes.scopeFor(startSectionBlock.statements + bodySectionBlock.statements)
			}
			else{
				var AwkProgram awkProgram = sectionBlock.eContainer as AwkProgram
				var startSectionBlock = awkProgram.sections.filter[x | x.section == SectionHeader.START].head as Section
				var bodySectionBlock = awkProgram.sections.filter[x | x.section == SectionHeader.BODY].head as Section
				var endSectionBlock = awkProgram.sections.filter[x | x.section == SectionHeader.END].head as Section
				return Scopes.scopeFor(startSectionBlock.statements + bodySectionBlock.statements + endSectionBlock.statements)
			}
		}
		return super.getScope(context, reference)
	}
}
