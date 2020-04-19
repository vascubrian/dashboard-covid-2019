import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const Footer = (props) => {
  return (
    <div style={{ padding: 15 }}>
      <div
        style={{
          fontWeight: "bold",
          display: "flex",
          justifyContent: "center",
          fontSize: 22,
          paddingBottom: 15,
        }}
      >
        <div
          style={{
            border: "3px solid white",
            padding: "5px 25px",
            borderRadius: 5,
            background: "white",
            color: "#404b69",
            cursor: "pointer",
          }}
        >

        </div>
      </div>
      <div>
        Designed and Developed by{"  "}
        <a
          style={{
            color: "#f6565b",
            fontWeight: "bold",
            textDecoration: "none",
          }}
         >
          Ranjith Nambiar
        </a>
      </div>
    </div>
  );
};

export default Footer;
