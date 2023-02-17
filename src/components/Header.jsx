import React from 'react';

const Header = ({ category, title }) => (
  <div className=" mb-10">
    <p className="text-lg text-gray-400">{category}</p>
    <p className="text-3xl font-bold tracking-wide text-white">
      {title}
    </p>
  </div>
);

export default Header;
