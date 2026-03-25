import json
import logging
from typing import Any, Dict

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def extract_finding_details(event: Dict[str, Any]) -> Dict[str, Any]:
    detail = event.get("detail", {})
    return {
        "finding_type": detail.get("type"),
        "severity": detail.get("severity"),
        "account_id": detail.get("accountId"),
        "region": detail.get("region"),
        "resource": detail.get("resource"),
        "title": detail.get("title"),
        "description": detail.get("description"),
    }


def lambda_handler(event: Dict[str, Any], context: Any) -> Dict[str, Any]:
    logger.info("Received event: %s", json.dumps(event))

    finding = extract_finding_details(event)

    logger.info("Parsed finding details: %s", json.dumps(finding))

    # Placeholder logic:
    # In a more advanced version, this function could:
    # - publish to SNS
    # - tag a resource for investigation
    # - disable a compromised access key
    # - enrich the event with account or IAM context

    response = {
        "status": "processed",
        "action": "logged_for_review",
        "finding_type": finding.get("finding_type"),
        "severity": finding.get("severity"),
    }

    logger.info("Response: %s", json.dumps(response))
    return response
